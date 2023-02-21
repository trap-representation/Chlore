/* this is not a part of the specification
   and is only meant to guide interpreter
   implementors */

/* an extremely small executable file has
   the following structure */

typedef struct {
  uint32_t magic_number;
  uint32_t specification_version;
  uint32_t code_alignment;
  uint32_t heap_alignment;
  uint64_t heap_size;
  uint64_t stack_size;
  uint64_t entry_point;
  void *code;
} esxf;

/* an extremely small loadable file has
   the following structure */

typedef struct {
  uint32_t magic_number;
  uint32_t specification_version;
  uint32_t code_alignment;
  uint32_t padding;
  uint64_t entry_point;
  void *code;
} esdf;
