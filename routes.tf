module "route_api1" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_api1.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}

module "route_api2" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_api2.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}

module "route_api3" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_api3.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}

module "route_rmq1" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_rmq1.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}

module "route_rmq2" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_rmq2.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}

module "route_rmq3" {
  source                 = "github.com/Monotype/infra-terraform//modules//route"
  route-table-id         = "${module.subnet_rmq3.route-table-id}"
  destination-cidr-block = "0.0.0.0/0"
  gw-id                  = "${module.vpc.igw-id}"
}
