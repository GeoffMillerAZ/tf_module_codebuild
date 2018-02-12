# resource "aws_iam_role" "codebuild_role" {
#   name = "codebuild-role-"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "codebuild.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_policy" "codebuild_policy" {
#   name        = "codebuild-policy"
#   path        = "/service-role/"
#   description = "Policy used in trust relationship with CodeBuild"

#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Resource": [
#         "*"
#       ],
#       "Action": [
#         "logs:CreateLogGroup",
#         "logs:CreateLogStream",
#         "logs:PutLogEvents"
#       ]
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
#   name       = "codebuild-policy-attachment"
#   policy_arn = "${aws_iam_policy.codebuild_policy.arn}"
#   roles      = ["${aws_iam_role.codebuild_role.id}"]
# }

variable "kops_cluster_name" {
   description = "name of the kops cluster this is for"
}

variable "job_source" {
   description = "git repo and location of the buildspec"
}

resource "aws_codebuild_project" "default" {
  name         = "kops-destroy-${var.kops_cluster_name}-cluster"
  description  = "Via KOPS this will destroy the ${var.kops_cluster_name} cluster"
  build_timeout      = "10"
  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/nodejs:6.3.1"
    type         = "LINUX_CONTAINER"

#     environment_variable {
#       "name"  = "SOME_KEY1"
#       "value" = "SOME_VALUE1"
#     }

#     environment_variable {
#       "name"  = "SOME_KEY2"
#       "value" = "SOME_VALUE2"
#     }
#   }

  source {
    type     = "GITHUB"
    location = "https://github.com/mitchellh/packer.git"
    buildspec = "buildspec.yml"
  }

#   tags {
#     "Environment" = "Test"
#   }
}