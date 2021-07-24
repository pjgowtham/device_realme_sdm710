package org.evolution.device.DeviceExtras;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Environment;
import android.service.quicksettings.TileService;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;

import org.evolution.device.DeviceExtras.R;

@TargetApi(24)
public class TTLTileService extends TileService {

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public void onTileAdded() {
        super.onTileAdded();
    }

    @Override
    public void onTileRemoved() {
        super.onTileRemoved();
    }

    @Override
    public void onStartListening() {
        super.onStartListening();
    }

    public Dialog ttlDialog() {
        CharSequence options[] = new CharSequence[]{
                "Set post-routing packet TTL to 64"};
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle(R.string.ttl_tile_dialog_title);
        alertDialog.setItems(options, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                if (SuShell.detectValidSuInPath()) {
                    switch (which) {
                        case 0:
                            new SetTTL().execute(true);
                            break;
                    }
                } else {
                    Toast.makeText(TTLTileService.this,
                            R.string.cannot_get_su, Toast.LENGTH_SHORT).show();
                }

            }
        });
        return alertDialog.create();
    }

    public void iptables() throws SuShell.SuDeniedException, IOException {
        String command = "iptables -t mangle -A POSTROUTING -o rmnet+ -j TTL --ttl-set 64 && ip6tables -t mangle -A POSTROUTING -o rmnet+ -j HL --hl-set 64";
        SuShell.runWithSuCheck(command);
    }

    private class SetTTL extends AsyncTask<Boolean, Void, Void> {

        private Exception mException = null;

        @Override
        protected Void doInBackground(Boolean... params) {
            try {
                if (params[0]) {
                    iptables();
                }
            } catch (SuShell.SuDeniedException e) {
                mException = e;
            } catch (IOException e) {
                e.printStackTrace();
                mException = e;
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            if (mException instanceof SuShell.SuDeniedException) {
                Toast.makeText(TTLTileService.this, R.string.cannot_get_su,
                        Toast.LENGTH_LONG).show();
                return;
            }
        }
    }

    @Override
    public void onClick() {
        super.onClick();
        showDialog(ttlDialog());
    }
}