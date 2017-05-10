module "vpc" {
    source               = "github.com/Monotype/infra-terraform//modules//vpc_base"
    cidr_block           = "${var.cidr_block}"
    project              = "${var.project}"
    environment          = "${var.environment}"
    enable_dns_hostnames = "${var.hostnames}"
    #enable_dns_support   = "${var.dnssupprt}" # not yet implemented
}
