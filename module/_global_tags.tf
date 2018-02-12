output "tags_global" {
  value = {
    Name        = ""
    Project     = ""
    Description = ""

    # Env         = "${}"
    # AWS_Account = "${}"
    # AWS_Alias   = "${}"
    # VPC_ID     = "${aws_vpc.default.id}" # fix circular reference
    Role = ""

    Stack               = ""
    Ticket              = ""
    RAFs                = ""
    TF_Doc              = ""                # TODO link to var
    TF_Diagram          = ""                # TODO link to var
    TF_Module           = "tf_module_realm"
    TF_Live_Module_Path = "${path.module}"  # TODO research sollution to multiple executors

    # TF_Caller_Arn       = "${data.aws_caller_identity.current.arn}"                                        # TODO research sollution to multiple executors
    # TF_Caller_User      = "${data.aws_caller_identity.current.user_id}"                                    # TODO research sollution to multiple executors
    # TF_Caller_Account   = "${data.aws_caller_identity.current.account_id}"                                 # TODO research sollution to multiple executors
    TF_Version = "${local.module_v_full}"

    TF_Workspace = "${terraform.workspace}"
    Keep_Until   = "-1"
  }
}
