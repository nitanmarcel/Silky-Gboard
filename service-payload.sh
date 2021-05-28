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

sleep 2
am force-stop com.google.android.inputmethod.latin