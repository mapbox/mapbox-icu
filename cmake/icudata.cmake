find_package(ICU QUIET)
if (ICU_PKGDATA_EXECUTABLE)
    set(_ICUDATA_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/icudt63l)

    add_custom_command(
        OUTPUT ${_ICUDATA_BINARY_DIR}
        COMMAND rm -rf ${_ICUDATA_BINARY_DIR}
        COMMAND mkdir -p ${_ICUDATA_BINARY_DIR}/curr ${_ICUDATA_BINARY_DIR}/lang ${_ICUDATA_BINARY_DIR}/region
        COMMAND mkdir -p ${_ICUDATA_BINARY_DIR}/zone ${_ICUDATA_BINARY_DIR}/unit ${_ICUDATA_BINARY_DIR}/brkitr
        COMMAND mkdir -p ${_ICUDATA_BINARY_DIR}/coll ${_ICUDATA_BINARY_DIR}/rbnf
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/unames.icu ${_ICUDATA_BINARY_DIR}/unames.icu
        COMMAND ${ICU_GENCNVAL_EXECUTABLE} -d ${_ICUDATA_BINARY_DIR} mappings/convrtrs.txt
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/coll/ucadata-unihan.icu ${_ICUDATA_BINARY_DIR}/coll/ucadata.icu
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/nfkc.nrm ${_ICUDATA_BINARY_DIR}/nfkc.nrm
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/nfkc_cf.nrm ${_ICUDATA_BINARY_DIR}/nfkc_cf.nrm
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/uts46.nrm ${_ICUDATA_BINARY_DIR}/uts46.nrm
        COMMAND ${ICU_MAKECONV_EXECUTABLE} -c -d ${_ICUDATA_BINARY_DIR} mappings/ibm-37_P100-1995.ucm
        COMMAND ${ICU_MAKECONV_EXECUTABLE} -c -d ${_ICUDATA_BINARY_DIR} mappings/ibm-1047_P100-1995.ucm
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${_ICUDATA_BINARY_DIR} -s misc -d ${_ICUDATA_BINARY_DIR} numberingSystems.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${_ICUDATA_BINARY_DIR} -s misc -d ${_ICUDATA_BINARY_DIR} icuver.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${_ICUDATA_BINARY_DIR} -s misc -d ${_ICUDATA_BINARY_DIR} icustd.txt
        COMMAND ${ICU_GENCFU_EXECUTABLE} -c -i ${_ICUDATA_BINARY_DIR} -r unidata/confusables.txt -w unidata/confusablesWholeScript.txt -o ${_ICUDATA_BINARY_DIR}/confusables.cfu
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
    )

    add_custom_command(
        OUTPUT ${_ICUDATA_BINARY_DIR}/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl locales/pool.res ${_ICUDATA_BINARY_DIR}/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl curr/pool.res ${_ICUDATA_BINARY_DIR}/curr/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl lang/pool.res ${_ICUDATA_BINARY_DIR}/lang/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl region/pool.res ${_ICUDATA_BINARY_DIR}/region/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl unit/pool.res ${_ICUDATA_BINARY_DIR}/unit/pool.res
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl zone/pool.res ${_ICUDATA_BINARY_DIR}/zone/pool.res
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
        DEPENDS ${_ICUDATA_BINARY_DIR}
    )

    add_custom_command(
        OUTPUT ${_ICUDATA_BINARY_DIR}/res_index.res
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated -d ${_ICUDATA_BINARY_DIR} res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/lang -d ${_ICUDATA_BINARY_DIR}/lang res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/region -d ${_ICUDATA_BINARY_DIR}/region res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/zone -d ${_ICUDATA_BINARY_DIR}/zone res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/coll -d ${_ICUDATA_BINARY_DIR}/coll res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/brkitr -d ${_ICUDATA_BINARY_DIR}/brkitr res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/rbnf -d ${_ICUDATA_BINARY_DIR}/rbnf res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/unit -d ${_ICUDATA_BINARY_DIR}/unit res_index.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${_ICUDATA_BINARY_DIR} -s generated/curr -d ${_ICUDATA_BINARY_DIR}/curr res_index.txt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
        DEPENDS ${_ICUDATA_BINARY_DIR}
    )

    set(locales_input_files root.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt ko.txt my.txt nl.txt
        pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ars.txt az_AZ.txt bs_BA.txt
        en_NH.txt en_RH.txt in.txt in_ID.txt iw.txt iw_IL.txt ja_JP_TRADITIONAL.txt mo.txt no.txt no_NO.txt no_NO_NY.txt
        pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt sr_BA.txt sr_CS.txt sr_Cyrl_CS.txt
        sr_Cyrl_YU.txt sr_Latn_CS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH_TRADITIONAL.txt tl.txt
        tl_PH.txt uz_AF.txt uz_UZ.txt vai_LR.txt yue_CN.txt yue_HK.txt zh_CN.txt zh_HK.txt zh_MO.txt zh_SG.txt zh_TW.txt)

    set(curr_input_files root.txt supplementalData.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt
        ko.txt my.txt nl.txt pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ar_SA.txt
        ars.txt az_AZ.txt az_Latn_AZ.txt bs_BA.txt bs_Latn_BA.txt en_NH.txt en_RH.txt fil_PH.txt he_IL.txt id_ID.txt in.txt
        in_ID.txt iw.txt iw_IL.txt ja_JP.txt ja_JP_TRADITIONAL.txt mo.txt nb_NO.txt nn_NO.txt no.txt no_NO.txt no_NO_NY.txt
        pa_Arab_PK.txt pa_Guru_IN.txt pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt shi_Tfng_MA.txt
        sr_BA.txt sr_CS.txt sr_Cyrl_BA.txt sr_Cyrl_CS.txt sr_Cyrl_RS.txt sr_Cyrl_XK.txt sr_Cyrl_YU.txt sr_Latn_BA.txt
        sr_Latn_CS.txt sr_Latn_ME.txt sr_Latn_RS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH.txt
        th_TH_TRADITIONAL.txt tl.txt tl_PH.txt uz_AF.txt uz_Arab_AF.txt uz_Latn_UZ.txt uz_UZ.txt vai_LR.txt vai_Vaii_LR.txt
        yue_CN.txt yue_HK.txt yue_Hans_CN.txt yue_Hant_HK.txt zh_CN.txt zh_HK.txt zh_Hans_CN.txt zh_Hant_TW.txt zh_MO.txt
        zh_SG.txt zh_TW.txt)

    set(unit_input_files root.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt ko.txt my.txt nl.txt
        pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ar_SA.txt ars.txt az_AZ.txt
        az_Latn_AZ.txt bs_BA.txt bs_Latn_BA.txt en_NH.txt en_RH.txt fil_PH.txt he_IL.txt id_ID.txt in.txt in_ID.txt iw.txt
        iw_IL.txt ja_JP.txt ja_JP_TRADITIONAL.txt mo.txt nb_NO.txt nn_NO.txt no.txt no_NO.txt no_NO_NY.txt pa_Arab_PK.txt
        pa_Guru_IN.txt pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt shi_Tfng_MA.txt sr_BA.txt
        sr_CS.txt sr_Cyrl_BA.txt sr_Cyrl_CS.txt sr_Cyrl_RS.txt sr_Cyrl_XK.txt sr_Cyrl_YU.txt sr_Latn_BA.txt sr_Latn_CS.txt
        sr_Latn_ME.txt sr_Latn_RS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH.txt th_TH_TRADITIONAL.txt
        tl.txt tl_PH.txt uz_AF.txt uz_Arab_AF.txt uz_Latn_UZ.txt uz_UZ.txt vai_LR.txt vai_Vaii_LR.txt yue_CN.txt yue_HK.txt
        yue_Hans_CN.txt yue_Hant_HK.txt zh_CN.txt zh_HK.txt zh_Hans_CN.txt zh_Hant_TW.txt zh_MO.txt zh_SG.txt zh_TW.txt)

    set(resource_bundle_output_files)

    function(generate_icudata_resource_bundle target destination_path)
        foreach(input_file IN LISTS ${target}_input_files)
            string(REPLACE ".txt" ".res" output_file ${input_file})
            list(APPEND resource_bundle_output_files "${destination_path}/${output_file}")
            set (resource_bundle_output_files ${resource_bundle_output_files} PARENT_SCOPE)
            add_custom_command(
                OUTPUT ${destination_path}/${output_file}
                COMMAND ${ICU_GENRB_EXECUTABLE} --usePoolBundle -k -i ${_ICUDATA_BINARY_DIR} -s ${target} -d ${destination_path} ${input_file}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
                DEPENDS ${_ICUDATA_BINARY_DIR}
            )
        endforeach()
    endfunction()

    generate_icudata_resource_bundle(locales ${_ICUDATA_BINARY_DIR})
    generate_icudata_resource_bundle(curr ${_ICUDATA_BINARY_DIR}/curr)
    generate_icudata_resource_bundle(unit ${_ICUDATA_BINARY_DIR}/unit)

    if (APPLE)
        add_custom_command(
            OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
            COMMAND find . -not -type d -print | awk "{print substr($1,3); }" > ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
            WORKING_DIRECTORY ${_ICUDATA_BINARY_DIR}
            VERBATIM
            DEPENDS ${_ICUDATA_BINARY_DIR}/pool.res
            DEPENDS ${_ICUDATA_BINARY_DIR}/res_index.res
            DEPENDS ${resource_bundle_output_files}
        )

        add_custom_command(
                OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/libicudata.a
                COMMAND ${ICU_PKGDATA_EXECUTABLE} -q -c -s ${_ICUDATA_BINARY_DIR} -d ${CMAKE_CURRENT_BINARY_DIR} -O ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data/pkgdata.osx.inc -e icudt63  -T ${CMAKE_CURRENT_BINARY_DIR} -p icudt63l -m static -r 63.1 -L icudata ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
                DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
                DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data/pkgdata.osx.inc
        )
    else()
        add_custom_command(
            OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
            COMMAND find -not -type d -printf '%P\\n' > ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
            WORKING_DIRECTORY ${_ICUDATA_BINARY_DIR}
            DEPENDS ${_ICUDATA_BINARY_DIR}/pool.res
            DEPENDS ${_ICUDATA_BINARY_DIR}/res_index.res
            DEPENDS ${resource_bundle_output_files}
        )

        add_custom_command(
                OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/libicudata.a
                COMMAND ${ICU_PKGDATA_EXECUTABLE} -q -c -s ${_ICUDATA_BINARY_DIR} -d ${CMAKE_CURRENT_BINARY_DIR} -e icudt63  -T ${CMAKE_CURRENT_BINARY_DIR} -p icudt63l -m static -r 63.1 -L icudata ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
                DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
        )
    endif()

    add_custom_target(icudata-pkgdata ALL
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/libicudata.a
    )

    add_library(icudata STATIC IMPORTED GLOBAL)
    set_target_properties(icudata PROPERTIES
        IMPORTED_LOCATION ${CMAKE_CURRENT_BINARY_DIR}/libicudata.a
    )
    add_dependencies(icudata
        icudata-pkgdata
    )
else()
    add_library(icudata STATIC
        ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/stubdata/stubdata.cpp
    )

    target_include_directories(icudata PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common
    )

    target_compile_definitions(icudata PRIVATE
        ${ICU_COMPILE_DEFINITIONS}
    )
endif()
