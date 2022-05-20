variable "region" {
    default = ""
}

variable "instance_type" {
    default = ""
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "simple-ami-test" {
    region = var.region
    instance_type = var.instance_type
    ami_name = "simple-simple-ami-test-${local.timestamp}"
    source_ami_filter {
        filters = {
            virtualization-type = "hvm"
            architecture = "x86_64"
            name = "*amzn2-ami-hvm-*"
            root-device-type = "ebs"
        }
        owners = ["amazon"]
        most_recent = true
    }
    ssh_username = "ec2-user"
}

build {
    sources = [
        "source.amazon-ebs.simple-ami-test"
    ]
}