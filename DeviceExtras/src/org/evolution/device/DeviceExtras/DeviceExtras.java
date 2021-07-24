/*
* Copyright (C) 2016 The OmniROM Project
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*
*/
package org.evolution.device.DeviceExtras;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.UserHandle;
import android.os.Vibrator;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;
import android.widget.ListView;
import androidx.preference.ListPreference;
import androidx.preference.Preference;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceGroup;
import androidx.preference.PreferenceManager;
import androidx.preference.PreferenceScreen;
import androidx.preference.SwitchPreference;
import androidx.preference.TwoStatePreference;

import java.util.Arrays;

import org.evolution.device.DeviceExtras.Constants;
import org.evolution.device.DeviceExtras.doze.DozeSettingsActivity;
import org.evolution.device.DeviceExtras.FileUtils;
import org.evolution.device.DeviceExtras.kcal.KCalSettingsActivity;
import org.evolution.device.DeviceExtras.R;

public class DeviceExtras extends PreferenceFragment
        implements Preference.OnPreferenceChangeListener {
    private static final String TAG = DeviceExtras.class.getSimpleName();

    public static final String KEY_VIBSTRENGTH = "vib_strength";
    public static final String SETTINGS_KEY = DeviceExtras.KEY_SETTINGS_PREFIX + DeviceExtras.KEY_VIBSTRENGTH;
    private static final String FILE_LEVEL = "/sys/devices/platform/soc/a8c000.i2c/i2c-3/3-005a/leds/vibrator/level";
    public static final String DEFAULT = "3";
    private static final long testVibrationPattern[] = {0,50};

    public static final String KEY_AUTO_HBM_SWITCH = "auto_hbm";
    public static final String KEY_AUTO_HBM_THRESHOLD = "auto_hbm_threshold";
    public static final String KEY_DC_SWITCH = "dc";
    public static final String KEY_DOZE = "advanced_doze_settings";
    public static final String KEY_HBM_SWITCH = "hbm";
    public static final String KEY_KCAL = "kcal";
    public static final String CATEGORY_DISPLAY = "display";
    public static final String KEY_GAME_SWITCH = "game_mode";
    public static final String KEY_SETTINGS_PREFIX = "device_setting_";

    private static TwoStatePreference mAutoHBMSwitch;
    private static TwoStatePreference mDCModeSwitch;
    private static TwoStatePreference mHBMModeSwitch;
    private static TwoStatePreference mGameModeSwitch;
    private CustomSeekBarPreference mVibratorStrengthPreference;
    private Preference mKcal;
    private ListPreference mBottomKeyPref;
    private ListPreference mMiddleKeyPref;
    private ListPreference mTopKeyPref;
    private Preference mDozeSettings;
    private Vibrator mVibrator;

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        final SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this.getContext());
        addPreferencesFromResource(R.xml.main);
        getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);

        // AutoHBM Toggle
        mAutoHBMSwitch = (TwoStatePreference) findPreference(KEY_AUTO_HBM_SWITCH);
        mAutoHBMSwitch.setChecked(PreferenceManager.getDefaultSharedPreferences(getContext()).getBoolean(DeviceExtras.KEY_AUTO_HBM_SWITCH, false));
        mAutoHBMSwitch.setOnPreferenceChangeListener(this);

        // DC-Dimming Toggle
        mDCModeSwitch = (TwoStatePreference) findPreference(KEY_DC_SWITCH);
        mDCModeSwitch.setEnabled(DCModeSwitch.isSupported());
        mDCModeSwitch.setChecked(DCModeSwitch.isCurrentlyEnabled(this.getContext()));
        mDCModeSwitch.setOnPreferenceChangeListener(new DCModeSwitch());

        // Game Mode Toggle
        mGameModeSwitch = (TwoStatePreference) findPreference(KEY_GAME_SWITCH);
        mGameModeSwitch.setEnabled(GameModeSwitch.isSupported());
        mGameModeSwitch.setChecked(GameModeSwitch.isCurrentlyEnabled(this.getContext()));
        mGameModeSwitch.setOnPreferenceChangeListener(new GameModeSwitch());
        
        // DozeSettings Activity
        mDozeSettings = (Preference)findPreference(KEY_DOZE);
        mDozeSettings.setOnPreferenceClickListener(preference -> {
            Intent intent = new Intent(getActivity().getApplicationContext(), DozeSettingsActivity.class);
            startActivity(intent);
            return true;
        });

        // HBM Toggle
        mHBMModeSwitch = (TwoStatePreference) findPreference(KEY_HBM_SWITCH);
        mHBMModeSwitch.setEnabled(HBMModeSwitch.isSupported());
        mHBMModeSwitch.setChecked(HBMModeSwitch.isCurrentlyEnabled(this.getContext()));
        mHBMModeSwitch.setOnPreferenceChangeListener(new HBMModeSwitch());

        // Kcal Activity
        mKcal = findPreference(KEY_KCAL);
        mKcal.setOnPreferenceClickListener(preference -> {
            Intent intent = new Intent(getActivity().getApplicationContext(), KCalSettingsActivity.class);
            startActivity(intent);
            return true;
        });

        // Vibration Intensity Preference
        mVibrator = (Vibrator) getContext().getSystemService(Context.VIBRATOR_SERVICE);
        mVibratorStrengthPreference =  (CustomSeekBarPreference) findPreference(KEY_VIBSTRENGTH);
        mVibratorStrengthPreference.setValue(Integer.parseInt(FileUtils.getFileValue(FILE_LEVEL, DEFAULT)));
        mVibratorStrengthPreference.setOnPreferenceChangeListener(this);
    }

    private void registerPreferenceListener(String key) {
        Preference p = findPreference(key);
        p.setOnPreferenceChangeListener(this);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (preference == mAutoHBMSwitch) {
            Boolean enabled = (Boolean) newValue;
            SharedPreferences.Editor prefChange = PreferenceManager.getDefaultSharedPreferences(getContext()).edit();
            prefChange.putBoolean(KEY_AUTO_HBM_SWITCH, enabled).commit();
            FileUtils.enableService(getContext());
            return true;
        } else if (preference == mVibratorStrengthPreference) {
    	    FileUtils.writeValue(FILE_LEVEL, String.valueOf(newValue));
            Settings.System.putString(getContext().getContentResolver(), SETTINGS_KEY, String.valueOf(newValue));
            mVibrator.vibrate(testVibrationPattern, -1);
            return true;
    }

        String key = preference.getKey();
        String node = Constants.sBooleanNodePreferenceMap.get(key);
        if (!TextUtils.isEmpty(node) && FileUtils.fileWritable(node)) {
            Boolean value = (Boolean) newValue;
            FileUtils.writeValue(node, value ? "1" : "0");
            return true;
        }
        node = Constants.sStringNodePreferenceMap.get(key);
        if (!TextUtils.isEmpty(node) && FileUtils.fileWritable(node)) {
            FileUtils.writeValue(node, (String) newValue);
            return true;
        }

        return false;
    }
	
    @Override
    public void addPreferencesFromResource(int preferencesResId) {
        super.addPreferencesFromResource(preferencesResId);
        // Initialize node preferences
        for (String pref : Constants.sBooleanNodePreferenceMap.keySet()) {
            SwitchPreference b = (SwitchPreference) findPreference(pref);
            if (b == null) continue;
            String node = Constants.sBooleanNodePreferenceMap.get(pref);
            if (FileUtils.isFileReadable(node)) {
                String curNodeValue = FileUtils.readOneLine(node);
                b.setChecked(curNodeValue.equals("1"));
                b.setOnPreferenceChangeListener(this);
            } else {
                removePref(b);
            }
        }
        for (String pref : Constants.sStringNodePreferenceMap.keySet()) {
            ListPreference l = (ListPreference) findPreference(pref);
            if (l == null) continue;
            String node = Constants.sStringNodePreferenceMap.get(pref);
            if (FileUtils.isFileReadable(node)) {
                l.setValue(FileUtils.readOneLine(node));
                l.setOnPreferenceChangeListener(this);
            } else {
                removePref(l);
            }
        }
    }

    private void removePref(Preference pref) {
        PreferenceGroup parent = pref.getParent();
        if (parent == null) {
            return;
        }
        parent.removePreference(pref);
        if (parent.getPreferenceCount() == 0) {
            removePref(parent);
        }
    }

    public static boolean isAUTOHBMEnabled(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(DeviceExtras.KEY_AUTO_HBM_SWITCH, false);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
        // Respond to the action bar's Up/Home button
        case android.R.id.home:
            getActivity().finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
