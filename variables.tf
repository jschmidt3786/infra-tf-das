variable aws_region {
  description = "AWS region"
  default     = "us-east-1"
}
variable cidr_block {
  description = "VPC CIDR network"
  default     = "10.0.0.0/16"
}
variable hostnames {
  description = "use DNS hostnames, boolean"
  default     = "true"
}
variable dnssupprt {
  description = "use DNS support, boolean"
  default     = "true"
}

variable project {
  description = "project name"
}
variable environment {
  description = "environment name"
}

variable subnet_api_ip {
  description = "API subnet"
}

variable subnet_api1_ip {
  description = "API subnet 1"
}
variable subnet_api1_az {
  description = "API availability zone 1"
}

variable subnet_api2_ip {
  description = "API subnet 2"
}
variable subnet_api2_az {
  description = "API availability zone 2"
}

variable subnet_api3_ip {
  description = "API subnet 3"
}
variable subnet_api3_az {
  description = "API availability zone 3"
}


variable subnet_rmq1_ip {
  description = "API subnet 1"
}
variable subnet_rmq1_az {
  description = "API availability zone 1"
}

variable subnet_rmq2_ip {
  description = "API subnet 2"
}
variable subnet_rmq2_az {
  description = "API availability zone 2"
}

variable subnet_rmq3_ip {
  description = "API subnet 3"
}
variable subnet_rmq3_az {
  description = "API availability zone 3"
}


variable route_api_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable route_api1_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable route_api2_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable route_api3_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}


variable route_rmq1_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable route_rmq2_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable route_rmq3_cidr {
  description = "route destination network (CIDR)"
  default     = "0.0.0.0/0"
}

variable allow-ssh-from-world-cidr {
  type = "list"
  description = "CIDR network"
  default     = ["0.0.0.0/0"]
}

variable allow-rabbitmq-from-mt1-cidr {
  type = "list"
  description = "CIDR network"
  default     = ["0.0.0.0/0"]
}

variable allow-rabbitmq-from-mt2-cidr {
  type = "list"
  description = "CIDR network"
  default     = ["0.0.0.0/0"]
}

variable api-loadbalancer-subnets {
  type = "list"
  description = "API loadbalancer subnets"
}

variable api-loadbalancer-internal {
  description = "If true, ELB will be an internal ELB."
  default     = "true"
}
