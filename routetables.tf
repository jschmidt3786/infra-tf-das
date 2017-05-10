module "route_table_assoc_api1" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_api1.route-table-id}"
  subnet-id = "${module.subnet_api1.subnet-id}"
}

module "route_table_assoc_api2" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_api2.route-table-id}"
  subnet-id = "${module.subnet_api2.subnet-id}"
}

module "route_table_assoc_api3" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_api3.route-table-id}"
  subnet-id = "${module.subnet_api3.subnet-id}"
}


module "route_table_assoc_rmq1" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_rmq1.route-table-id}"
  subnet-id = "${module.subnet_rmq1.subnet-id}"
}

module "route_table_assoc_rmq2" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_rmq2.route-table-id}"
  subnet-id = "${module.subnet_rmq2.subnet-id}"
}

module "route_table_assoc_rmq3" {
  source    = "github.com/Monotype/infra-terraform//modules//route-assoc"
  route-id  = "${module.subnet_rmq3.route-table-id}"
  subnet-id = "${module.subnet_rmq3.subnet-id}"
}
