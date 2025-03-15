/* Generated by           cobc 3.2.0 */
/* Generated from         samples/sample-ncurses-window.cbl */
/* Generated at           Mar 14 2025 18:55:05 */
/* GnuCOBOL build date    Jul 28 2023 18:42:18 */
/* GnuCOBOL package date  Jul 28 2023 17:02:56 UTC */
/* Compile command        cobc -C -o bin-samples/sample-ncurses-window.c samples/sample-ncurses-window.cbl */

#include <string.h> /* for memcpy, memcmp and friends */
#define  COB_KEYWORD_INLINE __inline
#include <libcob.h>

#define  COB_SOURCE_FILE		"samples/sample-ncurses-window.cbl"
#define  COB_PACKAGE_VERSION		"3.2"
#define  COB_PATCH_LEVEL		0
#define  COB_MODULE_FORMATTED_DATE	"Mar 14 2025 18:55:05"
#define  COB_MODULE_DATE		20250314
#define  COB_MODULE_TIME		185505

/* Global variables */
#include "sample-ncurses-window.c.h"

/* Function prototypes */

COB_EXT_EXPORT int		sample__ncurses__window (void);
static int		sample__ncurses__window_ (const int);
static void		sample__ncurses__window_module_init (cob_module *module);

/* Functions */

static void gc_module_so_init () __attribute__ ((constructor));
static void gc_module_so_init ()
{
  cob_check_version (COB_SOURCE_FILE, COB_PACKAGE_VERSION, COB_PATCH_LEVEL);
}

/* PROGRAM-ID 'sample-ncurses-window' */

/* ENTRY 'sample__ncurses__window' */

int
sample__ncurses__window ()
{
  return sample__ncurses__window_ (0);
}

static int
sample__ncurses__window_ (const int entry)
{
  /* Program local variables */
  #include "sample-ncurses-window.c.l.h"

  /* Start of function code */

  /* CANCEL callback */
  if (unlikely(entry < 0)) {
  	if (entry == -10)
  		goto P_dump;
  	if (entry == -20)
  		goto P_clear_decimal;
  	goto P_cancel;
  }

  /* Check initialized, check module allocated, */
  /* set global pointer, */
  /* push module stack, save call parameter count */
  if (cob_module_global_enter (&module, &cob_glob_ptr, 0, entry, 0))
  	return -1;

  /* Set address of module parameter list */
  module->cob_procedure_params = cob_procedure_params;

  /* Set frame stack pointer */
  frame_ptr = frame_stack;
  frame_ptr->perform_through = 0;
  frame_ptr->return_address_ptr = &&P_cgerror;

  /* Initialize rest of program */
  if (unlikely(initialized == 0)) {
  	goto P_initialize;
  }
  P_ret_initialize:

  /* Increment module active */
  module->module_active++;

  /* Entry dispatch */
  goto l_2;

  /* PROCEDURE DIVISION */

  /* Line: 18        : Entry     sample-ncurses-window   : samples/sample-ncurses-window.cbl */
  l_2:;

  /* Line: 18        : CALL               : samples/sample-ncurses-window.cbl */
  cob_procedure_params[0] = (cob_field *)&c_1;
  cob_glob_ptr->cob_call_params = 1;
  cob_glob_ptr->cob_stmt_exception = 0;
  if (unlikely((cob_glob_ptr->cob_exception_code & 0x0b00) == 0x0b00)) cob_glob_ptr->cob_exception_code = 0;
    if (unlikely(call_NCURSES__UTIL.funcvoid == NULL || cob_glob_ptr->cob_physical_cancel == 1))
  {
    call_NCURSES__UTIL.funcvoid = cob_resolve_cobol ("NCURSES-UTIL", 0, 1);
  }
  b_2 = ((int (*)(void *))call_NCURSES__UTIL.funcint) ((cob_u8_ptr)"INITIALIZE-NCURSES");

  /* Line: 20        : CALL               : samples/sample-ncurses-window.cbl */
  cob_procedure_params[0] = &f_17;
  cob_procedure_params[1] = &f_18;
  cob_procedure_params[2] = &f_19;
  cob_procedure_params[3] = &f_20;
  cob_procedure_params[4] = &f_21;
  cob_glob_ptr->cob_call_params = 5;
  cob_glob_ptr->cob_stmt_exception = 0;
  if (unlikely((cob_glob_ptr->cob_exception_code & 0x0b00) == 0x0b00)) cob_glob_ptr->cob_exception_code = 0;
    if (unlikely(call_NCURSES__WINDOW.funcvoid == NULL || cob_glob_ptr->cob_physical_cancel == 1))
  {
    call_NCURSES__WINDOW.funcvoid = cob_resolve_cobol ("NCURSES-WINDOW", 0, 1);
  }
  b_2 = ((int (*)(void *, void *, void *, void *, void *))call_NCURSES__WINDOW.funcint) (b_17, b_18, b_19, b_20, b_21);

  /* Line: 26        : CALL               : samples/sample-ncurses-window.cbl */
  cob_procedure_params[0] = (cob_field *)&c_2;
  cob_glob_ptr->cob_call_params = 1;
  cob_glob_ptr->cob_stmt_exception = 0;
  if (unlikely((cob_glob_ptr->cob_exception_code & 0x0b00) == 0x0b00)) cob_glob_ptr->cob_exception_code = 0;
    if (unlikely(call_NCURSES__UTIL.funcvoid == NULL || cob_glob_ptr->cob_physical_cancel == 1))
  {
    call_NCURSES__UTIL.funcvoid = cob_resolve_cobol ("NCURSES-UTIL", 0, 1);
  }
  b_2 = ((int (*)(void *))call_NCURSES__UTIL.funcint) ((cob_u8_ptr)"UNLOAD-NCURSES");

  /* Line: 27        : STOP RUN           : samples/sample-ncurses-window.cbl */
  cob_stop_run (b_2);

  /* Program exit */

  /* Decrement module active count */
  if (module->module_active) {
  	module->module_active--;
  }

  /* Pop module stack */
  cob_module_leave (module);

  /* Program return */
  return b_2;
  P_cgerror:
  	cob_fatal_error (COB_FERROR_CODEGEN);


  /* Program initialization */
  P_initialize:

  sample__ncurses__window_module_init (module);

  module->collating_sequence = NULL;
  module->crt_status = NULL;
  module->cursor_pos = NULL;
  module->xml_code = NULL;
  module->xml_event = NULL;
  module->xml_information = NULL;
  module->xml_namespace = NULL;
  module->xml_namespace_prefix = NULL;
  module->xml_nnamespace = NULL;
  module->xml_nnamespace_prefix = NULL;
  module->xml_ntext = NULL;
  module->xml_text = NULL;
  module->json_code = NULL;
  module->json_status = NULL;

  /* Initialize cancel callback */
  cob_set_cancel (module);

  /* Initialize WORKING-STORAGE */
  /* initialize field RETURN-CODE */
  b_2 = 0;

  /* initialize field WINDOW-WIDTH */
  memcpy (b_17, "040", 3);

  /* initialize field WINDOW-HEIGHT */
  memcpy (b_18, "010", 3);

  /* initialize field WINDOW-X */
  memcpy (b_19, "005", 3);

  /* initialize field WINDOW-Y */
  memcpy (b_20, "005", 3);

  /* initialize field SHADOW-ENABLED */
  *(cob_u8_ptr)(b_21) = (unsigned char)'Y';


  if (0 == 1) goto P_cgerror;
  initialized = 1;
  goto P_ret_initialize;

  P_dump:
    return 0;


  /* CANCEL callback handling */
  P_cancel:

  if (!initialized)
  	return 0;
  if (module && module->module_active)
  	cob_fatal_error (COB_FERROR_CANCEL);

  call_NCURSES__WINDOW.funcvoid = NULL;
  call_NCURSES__UTIL.funcvoid = NULL;
  b_2 = 0;
  cob_module_free (&module);

  initialized = 0;

  P_clear_decimal:
  return 0;

}

/* End PROGRAM-ID 'sample-ncurses-window' */

/* Initialize module structure for sample-ncurses-window */
static void sample__ncurses__window_module_init (cob_module *module)
{
  module->module_name = "sample-ncurses-window";
  module->module_formatted_date = COB_MODULE_FORMATTED_DATE;
  module->module_source = COB_SOURCE_FILE;
  module->gc_version = COB_PACKAGE_VERSION;
  module->module_entry.funcptr = (void *(*)())sample__ncurses__window;
  module->module_cancel.funcptr = (void *(*)())sample__ncurses__window_;
  module->module_ref_count = NULL;
  module->module_path = &cob_module_path;
  module->module_active = 0;
  module->module_date = COB_MODULE_DATE;
  module->module_time = COB_MODULE_TIME;
  module->module_type = 0;
  module->module_param_cnt = 0;
  module->ebcdic_sign = 0;
  module->decimal_point = '.';
  module->currency_symbol = '$';
  module->numeric_separator = ',';
  module->flag_filename_mapping = 1;
  module->flag_binary_truncate = 1;
  module->flag_pretty_display = 1;
  module->flag_host_sign = 0;
  module->flag_no_phys_canc = 0;
  module->flag_main = 0;
  module->flag_fold_call = 0;
  module->flag_exit_program = 0;
  module->flag_debug_trace = 0;
  module->flag_dump_ready = 0;
  module->xml_mode = 1;
  module->module_stmt = 0;
  module->module_sources = NULL;
}

/* End functions */

