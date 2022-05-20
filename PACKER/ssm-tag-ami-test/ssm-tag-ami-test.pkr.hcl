variable "region" {
    default = ""
}

variable "instance_type" {
    default = ""
}

variable "ssh_interface" {
    default = ""
}

variable "iam_instance_profile" {
    default = ""
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

data "amazon-ami" "ssm-tag-src-ami-test" {
    filters = {
        architecture = "x86_64"
        virtualization-type = "hvm"
        name = "*amzn2-ami-hvm-*"
        root-device-type = "ebs"
    }
    owners = ["amazon"]
    most_recent = true
    region = var.region
}

source "amazon-ebs" "ssm-tag-ami-test" {
    ami_name = "ssm-tag-ami-test-${local.timestamp}"
    region = var.region
    instance_type = var.instance_type
    source_ami = data.amazon-ami.ssm-tag-src-ami-test.id
    communicator = "ssh"
    ssh_username = "ec2-user"
    ssh_interface = var.ssh_interface
    iam_instance_profile = var.iam_instance_profile
    tags = {
        Name = "SSM TAG AMI TEST"
        Date = "${local.timestamp}"
    }
}

build {
    name = "SSM TAG PACKER BUILDER"

    sources = [
        "source.amazon-ebs.ssm-tag-ami-test"
    ]
}