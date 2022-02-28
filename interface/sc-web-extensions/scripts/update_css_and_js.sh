sc_web_path=../../ostis-web-platform/sc-web/client
way_js_path=components/js/way/way.js

append_line()
{
    if grep -Fxq "$3" $1
    then
        echo -en "Link to " $blue"$2"$rst "already exists in " $blue"$1"$rst "\n"
    else
        echo -en "Append '" $green"$2"$rst "' -> " $green"$1"$rst "\n"
        echo $3 >> $1
    fi
}

append_js()
{
    append_line $1 $2 "<script type=\"text/javascript\" charset=\"utf-8\" src=\"/static/$2\"></script>"
}

copyFiles()
{
    mkdir ../../ostis-web-platform/sc-web/components/way
    cp -R way/src/. ../../ostis-web-platform/sc-web/components/way
}

copyFiles $sc_web_path/templates/components.html $way_js_path
append_js $sc_web_path/templates/components.html $way_js_path