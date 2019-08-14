find_package(ICU 60.2)
if (ICU_PKGDATA_EXECUTABLE)
    add_custom_target(icudata-misc ALL
        COMMAND rm -rf ${CMAKE_CURRENT_BINARY_DIR}/icudt63l
        COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/icudt63l
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/unames.icu ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/unames.icu
        COMMAND ${ICU_GENCNVAL_EXECUTABLE} -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l mappings/convrtrs.txt
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/coll/ucadata-unihan.icu ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/coll/ucadata.icu
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/nfkc.nrm ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/nfkc.nrm
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/nfkc_cf.nrm ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/nfkc_cf.nrm
        COMMAND ${ICU_ICUPKG_EXECUTABLE} -tl in/uts46.nrm ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/uts46.nrm
        COMMAND ${ICU_MAKECONV_EXECUTABLE} -c -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l mappings/ibm-37_P100-1995.ucm
        COMMAND ${ICU_MAKECONV_EXECUTABLE} -c -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l mappings/ibm-1047_P100-1995.ucm
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s misc -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l numberingSystems.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s misc -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l icuver.txt
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -q -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s misc -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l icustd.txt
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
    )

    function(add_icudata_resource_target target)
        add_custom_target(icudata-${target} ALL
            COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/${target}
            COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s generated/${target} -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/${target} res_index.txt
            COMMAND test -f ${target}/pool.res && ${ICU_ICUPKG_EXECUTABLE} -tl ${target}/pool.res ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/${target}/pool.res || true
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
        )
    endfunction()

    function(add_icudata_resource_files target)
        foreach(file IN LISTS ${target}_files)
            add_custom_command(TARGET icudata-${target} PRE_BUILD
                COMMAND ${ICU_GENRB_EXECUTABLE} --usePoolBundle -k -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s ${target} -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/${target} ${file}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
            )
        endforeach()
    endfunction()

    set(locales_files root.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt ko.txt my.txt nl.txt
        pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ars.txt az_AZ.txt bs_BA.txt
        en_NH.txt en_RH.txt in.txt in_ID.txt iw.txt iw_IL.txt ja_JP_TRADITIONAL.txt mo.txt no.txt no_NO.txt no_NO_NY.txt
        pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt sr_BA.txt sr_CS.txt sr_Cyrl_CS.txt
        sr_Cyrl_YU.txt sr_Latn_CS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH_TRADITIONAL.txt tl.txt
        tl_PH.txt uz_AF.txt uz_UZ.txt vai_LR.txt yue_CN.txt yue_HK.txt zh_CN.txt zh_HK.txt zh_MO.txt zh_SG.txt zh_TW.txt)

    set(curr_files root.txt supplementalData.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt
        ko.txt my.txt nl.txt pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ar_SA.txt
        ars.txt az_AZ.txt az_Latn_AZ.txt bs_BA.txt bs_Latn_BA.txt en_NH.txt en_RH.txt fil_PH.txt he_IL.txt id_ID.txt in.txt
        in_ID.txt iw.txt iw_IL.txt ja_JP.txt ja_JP_TRADITIONAL.txt mo.txt nb_NO.txt nn_NO.txt no.txt no_NO.txt no_NO_NY.txt
        pa_Arab_PK.txt pa_Guru_IN.txt pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt shi_Tfng_MA.txt
        sr_BA.txt sr_CS.txt sr_Cyrl_BA.txt sr_Cyrl_CS.txt sr_Cyrl_RS.txt sr_Cyrl_XK.txt sr_Cyrl_YU.txt sr_Latn_BA.txt
        sr_Latn_CS.txt sr_Latn_ME.txt sr_Latn_RS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH.txt
        th_TH_TRADITIONAL.txt tl.txt tl_PH.txt uz_AF.txt uz_Arab_AF.txt uz_Latn_UZ.txt uz_UZ.txt vai_LR.txt vai_Vaii_LR.txt
        yue_CN.txt yue_HK.txt yue_Hans_CN.txt yue_Hant_HK.txt zh_CN.txt zh_HK.txt zh_Hans_CN.txt zh_Hant_TW.txt zh_MO.txt
        zh_SG.txt zh_TW.txt)

    set(unit_files root.txt da.txt de.txt en.txt eo.txt es.txt fi.txt fr.txt he.txt id.txt it.txt ko.txt my.txt nl.txt
        pl.txt pt.txt pt_PT.txt ro.txt ru.txt sv.txt tr.txt uk.txt vi.txt zh.txt zh_Hans.txt ar_SA.txt ars.txt az_AZ.txt
        az_Latn_AZ.txt bs_BA.txt bs_Latn_BA.txt en_NH.txt en_RH.txt fil_PH.txt he_IL.txt id_ID.txt in.txt in_ID.txt iw.txt
        iw_IL.txt ja_JP.txt ja_JP_TRADITIONAL.txt mo.txt nb_NO.txt nn_NO.txt no.txt no_NO.txt no_NO_NY.txt pa_Arab_PK.txt
        pa_Guru_IN.txt pa_IN.txt pa_PK.txt sh.txt sh_BA.txt sh_CS.txt sh_YU.txt shi_MA.txt shi_Tfng_MA.txt sr_BA.txt
        sr_CS.txt sr_Cyrl_BA.txt sr_Cyrl_CS.txt sr_Cyrl_RS.txt sr_Cyrl_XK.txt sr_Cyrl_YU.txt sr_Latn_BA.txt sr_Latn_CS.txt
        sr_Latn_ME.txt sr_Latn_RS.txt sr_Latn_YU.txt sr_ME.txt sr_RS.txt sr_XK.txt sr_YU.txt th_TH.txt th_TH_TRADITIONAL.txt
        tl.txt tl_PH.txt uz_AF.txt uz_Arab_AF.txt uz_Latn_UZ.txt uz_UZ.txt vai_LR.txt vai_Vaii_LR.txt yue_CN.txt yue_HK.txt
        yue_Hans_CN.txt yue_Hant_HK.txt zh_CN.txt zh_HK.txt zh_Hans_CN.txt zh_Hant_TW.txt zh_MO.txt zh_SG.txt zh_TW.txt)

    add_icudata_resource_target(lang)
    add_icudata_resource_target(region)
    add_icudata_resource_target(zone)
    add_icudata_resource_target(coll)
    add_icudata_resource_target(brkitr)
    add_icudata_resource_target(rbnf)

    add_icudata_resource_target(unit)
    add_icudata_resource_files(unit)

    add_icudata_resource_target(curr)
    add_icudata_resource_files(curr)

    add_custom_target(icudata-locales ALL
        COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/icudt63l
        COMMAND ${ICU_GENRB_EXECUTABLE} -k -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s generated -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l res_index.txt
        COMMAND test -f locales/pool.res && ${ICU_ICUPKG_EXECUTABLE} -tl locales/pool.res ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/pool.res || true
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
    )

    foreach(file IN LISTS locales_files)
        add_custom_command(TARGET icudata-locales PRE_BUILD
            COMMAND ${ICU_GENRB_EXECUTABLE} --usePoolBundle -k -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -s locales -d ${CMAKE_CURRENT_BINARY_DIR}/icudt63l ${file}
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
        )
    endforeach()

    add_custom_target(icudata-confusables ALL
        COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/icudt63l
        COMMAND ${ICU_GENCFU_EXECUTABLE} -c -i ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -r unidata/confusables.txt -w unidata/confusablesWholeScript.txt -o ${CMAKE_CURRENT_BINARY_DIR}/icudt63l/confusables.cfu
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
    )

    add_custom_target(icudata-lst ALL
        COMMAND rm -rf ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
        COMMAND find -not -type d -printf '%P\\n' > ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/icudt63l
        DEPENDS icudata-misc icudata-lang icudata-region icudata-zone icudata-coll icudata-brkitr icudata-rbnf icudata-unit icudata-locales icudata-curr icudata-confusables
    )

    add_custom_target(icudata-pkgdata ALL
        COMMAND ${ICU_PKGDATA_EXECUTABLE} -q -c -s ${CMAKE_CURRENT_BINARY_DIR}/icudt63l -d ${CMAKE_CURRENT_BINARY_DIR} -e icudt63  -T ${CMAKE_CURRENT_BINARY_DIR} -p icudt63l -m static -r 63.1 -L icudata ${CMAKE_CURRENT_BINARY_DIR}/icudata.lst
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/data
        DEPENDS icudata-lst
    )

    add_library(icudata STATIC IMPORTED GLOBAL)
    set_target_properties(icudata PROPERTIES
        IMPORTED_LOCATION ${CMAKE_CURRENT_BINARY_DIR}/libicudata.a
    )
    add_dependencies(icudata icudata-pkgdata)

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
