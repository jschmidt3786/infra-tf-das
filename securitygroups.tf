module "ssh-security-group" {
  source                     = "github.com/monotype/infra-terraform//modules//security-group"
  security-group-name        = "allow-ssh-from-world"
  security-group-description = "tcp port 22 from 0.0.0.0/0"
  vpc-id                     = "${module.vpc.vpc-id}"
}
module "allow-ssh-from-world" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.ssh-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "22"
  to-port           = "22"
  cidr-blocks       = ["${var.allow-ssh-from-world-cidr}"]
}
module "allow-ssh-from-world-out" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.ssh-security-group.security-group-id}"
  rule-type         = "egress"
  protocol          = "-1"
  from-port         = "0"
  to-port           = "0"
  cidr-blocks       = ["0.0.0.0/0"]
}


module "web-security-group" {
  source                     = "github.com/monotype/infra-terraform//modules//security-group"
  security-group-name        = "allow-www-from-world"
  security-group-description = "tcp port 80/443 from 0.0.0.0/0"
  vpc-id                     = "${module.vpc.vpc-id}"
}
module "allow-http-from-world" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.web-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "80"
  to-port           = "80"
  cidr-blocks       = ["0.0.0.0/0"]
}
module "allow-https-from-world" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.web-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "443"
  to-port           = "443"
  cidr-blocks       = ["0.0.0.0/0"]
}
module "allow-https-from-world-out" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.web-security-group.security-group-id}"
  rule-type         = "egress"
  protocol          = "-1"
  from-port         = "0"
  to-port           = "0"
  cidr-blocks       = ["0.0.0.0/0"]
}


module "rabbitmq-security-group" {
  source                     = "github.com/monotype/infra-terraform//modules//security-group"
  security-group-name        = "allow-rabbitmq-from-mt"
  security-group-description = "tcp port 5672 from Monotype"
  vpc-id                     = "${module.vpc.vpc-id}"
}

module "allow-rabbitmq-from-mt1" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.rabbitmq-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "5672"
  to-port           = "5672"
  cidr-blocks       = ["${var.allow-rabbitmq-from-mt1-cidr}"]
}
module "allow-rabbitmq-from-mt2" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.rabbitmq-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "20000"
  to-port           = "20000"
  cidr-blocks       = ["${var.allow-rabbitmq-from-mt2-cidr}"]
}
module "allow-rabbitmq-from-world-out" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.rabbitmq-security-group.security-group-id}"
  rule-type         = "egress"
  protocol          = "-1"
  from-port         = "0"
  to-port           = "0"
  cidr-blocks       = ["0.0.0.0/0"]
}


module "database-security-group" {
  source                     = "github.com/monotype/infra-terraform//modules//security-group"
  security-group-name        = "allow-mysql-from-vpc"
  security-group-description = "tcp port 3306 from internal"
  vpc-id                     = "${module.vpc.vpc-id}"
}

module "allow-mysql-from-vpc" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.database-security-group.security-group-id}"
  rule-type         = "ingress"
  protocol          = "tcp"
  from-port         = "3306"
  to-port           = "3306"
  cidr-blocks       = ["${var.cidr_block}"]
}
module "allow-mysql-from-vpc-out" {
  source            = "github.com/monotype/infra-terraform//modules//security-group-rule"
  security-group-id = "${module.database-security-group.security-group-id}"
  rule-type         = "egress"
  protocol          = "-1"
  from-port         = "0"
  to-port           = "0"
  cidr-blocks       = ["0.0.0.0/0"]
}
