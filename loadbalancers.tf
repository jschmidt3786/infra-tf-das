module "api-loadbalancer" {
  #source                      = "github.com/monotype/infra-terraform//modules//loadbalancer"
  source                      = "/modules/loadbalancers/elb"
  #name                        = "${module.loadbalancer.elb_name}"
  name_prefix                 = "${module.loadbalancer.elb_name_prefix}"
  security_groups             = ["${module.loadbalancer.security_groups}"]
  subnets                     = ["${var.api-loadbalancer-subnets}"]
  #instances                   = ["${}"]
  internal                    = "${var.api-loadbalancer-internal}"
  #cross_zone_load_balancing   =
  #idle_timeout                =
  #connection_draining         =
  #connection_draining_timeout =
  #tags                        =

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
