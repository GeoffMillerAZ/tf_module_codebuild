module "config" {
  source = "../module"
}

locals {
  tags_global = "${module.config.tags_global}"

  tags_regional = "${merge(local.tags_global, map(
    "Region", var.region,
    "TF_Live_Path", var.tf_live_path,
    "TF_Live_File" ,var.tf_live_file,
    "TF_Live_Source_Path", var.tf_live_path,
    )
  )}"
}

variable "region" {}

variable "realm" {}

variable "tf_live_path" {
  description = "path to the tf live file that instantiated this module/resource"
}

variable "tf_live_file" {
  description = "path to the tf live file that instantiated this module/resource"
}

locals {
  realm  = "${var.realm}"
  region = "${var.region}"
}
