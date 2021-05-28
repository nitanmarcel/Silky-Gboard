##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment DEBUG if you want full debug logs (saved to /sdcard)
#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#DEBUG=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
# Enable silky GBoard
##########################################################################################

XML=/data/data/com.google.android.inputmethod.latin/shared_prefs/flag_value.xml

sed -i -e 's/"silk_on_all_pixel" value="false"/"silk_on_all_pixel" value="true"/g' $XML
sed -i -e 's/"pill_shaped_key" value="false"/"pill_shaped_key" value="true"/g' $XML
sed -i -e 's/"silk_theme" value="false"/"silk_theme" value="true"/g' $XML
sed -i -e 's/"use_silk_theme_by_default" value="false"/"use_silk_theme_by_default" value="true"/g' $XML
sed -i -e 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $XML
sed -i -e 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $XML
sed -i -e 's/"use_keyboard_redesign_by_default" value="false"/"use_keyboard_redesign_by_default" value="true"/g' $XML
sed -i -e 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $XML
sed -i -e 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $XML

am force-stop com.google.android.inputmethod.latin
am start -a android.intent.action.MAIN -n com.google.android.inputmethod.latin/com.google.android.apps.inputmethod.latin.firstrun.LatinFirstRunActivity

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders in magisk module directory have the $MODPATH prefix - keep this prefix on all of your files/folders
  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
  # set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
