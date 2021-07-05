# Audio
PRODUCT_PROPERTY_OVERRIDES +=  \
    af.fast_track_multiplier=1 \
    vendor.audio_hal.period_size=192 \
    persist.vendor.audio.ambisonic.capture=false \
    persist.vendor.audio.ambisonic.auto.profile=false \
    ro.vendor.audio.sdk.fluencetype=none \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.audio.fluence.audiorec=false \
    persist.vendor.audio.fluence.tmic.enabled=false \
    vendor.audio.apptype.multirec.enabled=false \
    vendor.audio.record.multiple.enabled=false \
    persist.vendor.audio.spv3.enable=true \
    persist.vendor.audio.avs.afe_api_version=2 \
    vendor.audio.tunnel.encode=false \
    persist.vendor.audio.ras.enabled=false \
    vendor.audio.offload.buffer.size.kb=64 \
    audio.offload.min.duration.secs=30 \
    audio.offload.video=true \
    vendor.audio.offload.track.enable=true \
    audio.deep_buffer.media=true \
    vendor.voice.path.for.pcm.voip=true \
    vendor.audio.offload.multiaac.enable=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.passthrough=false \
    ro.vendor.audio.sdk.ssr=false \
    vendor.audio.offload.gapless.enabled=true \
    vendor.audio.safx.pbe.enabled=false \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio.hal.boot.timeout.ms=20000 \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.audio.hw.aac.encoder=true \
    persist.vendor.audio.hifi.int_codec=true \
    ro.af.client_heap_size_kbyte=7168 \
    vendor.audio.keep_alive.disabled=false \
    vendor.audio.volume.headset.gain.depcal=true \
    persist.vendor.audio.fluence.voicecomm=true \
    persist.vendor.bt.aac_frm_ctl.enabled=true \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.anc_headset.enable=true \
    vendor.audio.feature.battery_listener.enable=false \
    vendor.audio.feature.compr_cap.enable=false \
    vendor.audio.feature.compress_in.enable=false \
    vendor.audio.feature.compress_meta_data.enable=true \
    vendor.audio.feature.compr_voip.enable=false \
    vendor.audio.feature.concurrent_capture.enable=false \
    vendor.audio.feature.custom_stereo.enable=true \
    vendor.audio.feature.display_port.enable=true \
    vendor.audio.feature.dsm_feedback.enable=false \
    vendor.audio.feature.dynamic_ecns.enable=false \
    vendor.audio.feature.ext_hw_plugin.enable=false \
    vendor.audio.feature.external_dsp.enable=false \
    vendor.audio.feature.external_speaker.enable=false \
    vendor.audio.feature.external_speaker_tfa.enable=false \
    vendor.audio.feature.fluence.enable=true \
    vendor.audio.feature.fm.enable=true \
    vendor.audio.feature.hdmi_edid.enable=true \
    vendor.audio.feature.hdmi_passthrough.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.hifi_audio.enable=true \
    vendor.audio.feature.hwdep_cal.enable=false \
    vendor.audio.feature.incall_music.enable=true \
    vendor.audio.feature.multi_voice_session.enable=true \
    vendor.audio.feature.keep_alive.enable=false \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.maxx_audio.enable=false \
    vendor.audio.feature.ras.enable=true \
    vendor.audio.feature.record_play_concurency.enable=false \
    vendor.audio.feature.src_trkn.enable=true \
    vendor.audio.feature.spkr_prot.enable=true \
    vendor.audio.feature.ssrec.enable=true \
    vendor.audio.feature.usb_offload.enable=true \
    vendor.audio.feature.usb_offload_burst_mode.enable=false \
    vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
    vendor.audio.feature.deepbuffer_as_primary.enable=false \
    vendor.audio.feature.vbat.enable=true \
    vendor.audio.feature.wsa.enable=false \
    vendor.audio.feature.audiozoom.enable=false \
    vendor.audio.feature.snd_mon.enable=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES +=  \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    persist.vendor.qcom.bluetooth.scram.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
   persist.camera.HAL3.enabled=1
   
# Charger
PRODUCT_PRODUCT_PROPERTIES += \
   ro.charger.enable_suspend=true

# CNE
PRODUCT_PRODUCT_PROPERTIES += \
   persist.vendor.cne.feature=1

# Codec2
PRODUCT_PROPERTY_OVERRIDES +=  \
   debug.stagefright.omx_default_rank=0 \
   debug.stagefright.ccodec=1
   
# Display
PRODUCT_PROPERTY_OVERRIDES +=  \
    vendor.display.enable_default_color_mode=1 \
    ro.vendor.display.cabl=2

# DRM
PRODUCT_PROPERTY_OVERRIDES +=  \
    drm.service.enabled=true

# FRP
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES +=  \
   vendor.gatekeeper.disable_spu=true

# Graphics
PRODUCT_PROPERTY_OVERRIDES +=  \
    debug.egl.hw=0 \
    debug.sf.hw=0 \
    ro.opengles.version=196610 \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno

# IMS
PRODUCT_PROPERTY_OVERRIDES +=  \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# Netflix custom property
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.netflix.bsp_rev=Q670-14477-1

# Network manager
PRODUCT_PROPERTY_OVERRIDES +=  \
    persist.vendor.data.iwlan.enable=true \
    ro.telephony.iwlan_operation_mode=legacy

# NFC
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.hardware.nfc_nci=nqx.default

# Perf
PRODUCT_PROPERTY_OVERRIDES +=  \
    ro.vendor.extension_library=libqti-perfd-client.so

# Surfaceflinger
PRODUCT_PROPERTY_OVERRIDES +=  \
    debug.sf.hw=0 \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.native_mode=0

# Surfaceflinger default propery overrides    
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3
