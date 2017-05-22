module "subnet_api1" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.api.${var.subnet_api1_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_api1_ip}"
  subnet-az   = "${var.subnet_api1_az}"
}

module "subnet_api2" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.api.${var.subnet_api2_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_api2_ip}"
  subnet-az   = "${var.subnet_api2_az}"
}

module "subnet_api3" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.api.${var.subnet_api3_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_api3_ip}"
  subnet-az   = "${var.subnet_api3_az}"
}


module "subnet_rmq1" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.rmq.${var.subnet_rmq1_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_rmq1_ip}"
  subnet-az   = "${var.subnet_rmq1_az}"
}

module "subnet_rmq2" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.rmq.${var.subnet_rmq2_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_rmq2_ip}"
  subnet-az   = "${var.subnet_rmq2_az}"
}

module "subnet_rmq3" {
  source      = "github.com/Monotype/infra-terraform//modules//subnet"
  subnet-name = "${var.project}-${var.environment}.rmq.${var.subnet_rmq3_az}"
  vpc-id      = "${module.vpc.vpc-id}"
  subnet-ip   = "${var.subnet_rmq3_ip}"
  subnet-az   = "${var.subnet_rmq3_az}"
}
