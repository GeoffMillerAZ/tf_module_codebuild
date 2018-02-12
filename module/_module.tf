locals {
  module_tf_module = "tf_module_codebuild"
  module_v_major   = "0"
  module_v_minor   = "1"
  module_v_patch   = "0"
  module_v_full    = "${local.module_v_major}.${local.module_v_minor}.${local.module_v_patch}"
}