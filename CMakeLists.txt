cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
project(MAPBOX_ICU LANGUAGES CXX C)

# Required to avoid warnings when setting visibility
cmake_policy(SET CMP0063 NEW)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

set(ICU_COMPILE_DEFINITIONS
    UCONFIG_NO_BREAK_ITERATION=1
    UCONFIG_NO_LEGACY_CONVERSION=1
    U_ATTRIBUTE_DEPRECATED=
    U_CHARSET_IS_UTF8=1
    U_CHAR_TYPE=uint_least16_t
    U_ENABLE_DYLOAD=0
    U_HAVE_ATOMIC=1
    U_HAVE_STRTOD_L=1
    U_STATIC_IMPLEMENTATION=1
    U_USE_STRTOD_L=0
)

add_library(icuuc STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/appendable.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bmpset.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/brkeng.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/brkiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bytesinkutil.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bytestream.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bytestriebuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bytestrie.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/bytestrieiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/caniter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/characterproperties.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/chariter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/charstr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/cmemory.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/cstr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/cstring.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/cwchar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/dictbe.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/dictionarydata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/dtintrv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/edits.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/errorcode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/filteredbrk.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/filterednormalizer2.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/icudataver.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/icuplug.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/loadednormalizer2impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locavailable.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locbased.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locdispnames.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locdspnm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locid.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/loclikely.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locmap.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locresdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/locutil.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/messagepattern.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/normalizer2.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/normalizer2impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/normlzr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/parsepos.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/patternprops.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/pluralmap.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/propname.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/propsvec.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/punycode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/putil.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbi_cache.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbi.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbidata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbinode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbirb.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbiscan.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbisetb.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbistbl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/rbbitblb.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/resbund_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/resbund.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/resource.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ruleiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/schriter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/serv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servlk.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servlkf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servls.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servnotf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servrbf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/servslkf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/sharedobject.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/simpleformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/static_unicode_sets.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/stringpiece.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/stringtriebuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uarrsort.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubidi.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubidiln.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubidi_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubiditransform.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubidiwrt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ubrk.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucasemap.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucasemap_titlecase_brkiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uchar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucharstriebuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucharstrie.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucharstrieiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uchriter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucln_cmn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucmndata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv2022.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_bld.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvbocu.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_cb.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_ct.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvdisp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_err.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_ext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvhz.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_io.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvisci.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvlat1.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_lmb.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvmbcs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvscsu.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnvsel.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_set.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_u16.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_u32.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_u7.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucnv_u8.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucol_swp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucptrie.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ucurr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/udata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/udatamem.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/udataswp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uenum.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uhash.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uhash_us.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uidna.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uinit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uinvchar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ulist.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uloc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uloc_keytype.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uloc_tag.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/umapfile.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/umath.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/umutablecptrie.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/umutex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unames.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unifiedcache.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unifilt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unifunct.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uniset_closure.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uniset.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uniset_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unisetspan.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr_case.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr_case_locale.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unistr_titlecase_brkiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unormcmp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/unorm.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uobject.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uprops.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uresbund.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ures_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uresdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/usc_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uscript.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uscript_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uset.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/usetiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uset_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ushape.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/usprep.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustack.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustrcase.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustrcase_locale.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustr_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustrenum.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustrfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustring.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustr_titlecase_brkiter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustrtrns.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/ustr_wcs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utf_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/util.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/util_props.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utrace.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utrie2_builder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utrie2.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utrie.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utrie_swap.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uts46.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/utypes.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uvector.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uvectr32.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/uvectr64.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common/wintz.cpp
)

add_library(icui18n STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/alphaindex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/anytrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/astro.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/basictz.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/bocsu.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/brktrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/buddhcal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/calendar.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/casetrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/cecal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/chnsecal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/choicfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/coleitr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationbuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationcompare.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collation.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationdatabuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationdatareader.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationdatawriter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationfastlatinbuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationfastlatin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationfcd.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationkeys.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationroot.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationrootelements.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationruleparser.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationsets.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationsettings.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationtailoring.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/collationweights.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/coll.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/compactdecimalformat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/coptccal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/cpdtrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csdetect.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csmatch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csr2022.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csrecog.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csrmbcs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csrsbcs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csrucode.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/csrutf8.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/curramt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/currfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/currpinf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/currunit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dangical.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/datefmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dayperiodrules.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dcfmtsym.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/decContext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/decimfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/decNumber.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-bignum.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-bignum-dtoa.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-cached-powers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-diy-fp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-fast-dtoa.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/double-conversion-strtod.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dtfmtsym.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dtitvfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dtitvinf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dtptngen.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/dtrule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/erarules.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/esctrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ethpccal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/fmtable_cnv.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/fmtable.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/format.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/fphdlimp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/fpositer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/funcrepl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/gender.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/gregocal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/gregoimp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/hebrwcal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/indiancal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/inputext.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/islamcal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/japancal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/listformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/measfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/measunit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/measure.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/msgfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/name2uni.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nfrs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nfrule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nfsubs.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nortrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nounit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/nultrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_affixutils.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_asformat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_capi.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_compact.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_currencysymbols.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_decimalquantity.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_decimfmtprops.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_fluent.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_formatimpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_grouping.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_integerwidth.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_longnames.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_mapper.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_modifiers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_multiplier.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_notation.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_padding.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_patternmodifier.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_patternstring.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_rounding.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_scientific.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_skeletons.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_stringbuilder.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/number_utils.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_affixes.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_compositions.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_currency.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_decimal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_parsednumber.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_scientific.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_stringsegment.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_symbols.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numparse_validators.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numrange_fluent.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numrange_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/numsys.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/olsontz.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/persncal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/plurfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/plurrule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/quant.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/quantityformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbnf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbt_data.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbt_pars.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbt_rule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbt_set.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rbtz.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/regexcmp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/regeximp.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/regexst.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/regextxt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/region.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/reldatefmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/reldtfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rematch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/remtrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/repattrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/rulebasedcollator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/scientificnumberformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/scriptset.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/search.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/selfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/sharedbreakiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/simpletz.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/smpdtfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/smpdtfst.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/sortkey.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/standardplural.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/strmatch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/strrepl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/stsearch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/taiwncal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/timezone.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/titletrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tmunit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tmutamt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tmutfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tolowtrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/toupptrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/translit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/transreg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tridpars.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tzfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tzgnames.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tznames.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tznames_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tzrule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/tztrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucal.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucln_in.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucol.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucoleitr.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucol_res.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucol_sit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ucsdet.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/udat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/udateintervalformat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/udatpg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ufieldpositer.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uitercollationiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ulistformatter.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ulocdata.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/umsg.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/unesctrn.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uni2name.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/unum.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/unumsys.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/upluralrules.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uregexc.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uregex.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uregion.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/usearch.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uspoof_build.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uspoof_conf.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uspoof.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/uspoof_impl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/utf16collationiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/utf8collationiterator.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/utmscale.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/utrans.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/vtzone.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/vzone.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/windtfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/winnmfmt.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/wintzimpl.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/zonemeta.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/zrule.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n/ztrans.cpp
)

target_compile_definitions(icui18n PRIVATE
    U_I18N_IMPLEMENTATION=1
    ${ICU_COMPILE_DEFINITIONS}
)

target_compile_options(icui18n PRIVATE
    -Wno-error
    -Wno-shorten-64-to-32
)

target_include_directories(icui18n PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n
)

target_compile_definitions(icuuc PRIVATE
    U_COMMON_IMPLEMENTATION=1
    ${ICU_COMPILE_DEFINITIONS}
)

target_compile_options(icuuc PRIVATE
    -Wno-error
    -Wno-shorten-64-to-32
)

target_include_directories(icuuc PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n
)

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

add_library(icu INTERFACE)

target_include_directories(icu SYSTEM INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/common
    ${CMAKE_CURRENT_SOURCE_DIR}/icu4c/source/i18n
)

target_link_libraries(icu INTERFACE
    icui18n
    icuuc
    icudata
)
