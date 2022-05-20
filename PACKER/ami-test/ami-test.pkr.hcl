variable "region" {
    default = ""
}

variable "instance_type" {
    default = ""
}

variable "iam_instance_profile" {
    default = ""
}

variable "ssh_interface" {
    default = ""
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ami-test" {
    region = var.region
    instance_type = var.instance_type
    ami_name = "ami-test-${local.timestamp}"
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
    communicator = "ssh"
    ssh_username = "ec2-user"
    ssh_interface = var.ssh_interface
    iam_instance_profile = var.iam_instance_profile
}

build {
    sources = [
        "source.amazon-ebs.ami-test"
    ]
}