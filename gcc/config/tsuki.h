#undef TARGET_TSUKI
#define TARGET_TSUKI 1

#undef LIB_SPEC
#define LIB_SPEC "-lc -lg -lm -lnosys"

#undef STARTFILE_SPEC
#define STARTFILE_SPEC "crt0.o%s crti.o%s crtbegin.o%s"

#undef ENDFILE_SPEC
#define ENDFILE_SPEC "crtend.o%s crtn.o%s"

#undef TARGET_OS_CPP_BUILTINS
#define TARGET_OS_CPP_BUILTINS()			\
	do {						\
		builtin_define("__tsuki__");		\
		builtin_define("system=tsuki");		\
	} while (0);

#undef LINK_SPEC
#define LINK_SPEC "%{shared:-shared} %{static:-static} %{!shared: %{!static: %{rdynamic:-export-dynamic}}}"
