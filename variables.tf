variable "region-name" {
    description = "made region a variable"
    default = "eu-west-2"
    type=string
  }

variable "cidr-for-Prod-rock-vpc" {
    description = "the-cidr for-eu-west-2-for-vpc"
    default = "10.0.0.0/16"
    type=string
  }

variable "cidr-for-test-public-sub1" {
    description = "public cidr"
    default = "10.0.100.0/24"
    type=string
  }

variable "Availability-Zone1" {
    description = "availability zone"
    default = "eu-west-2a"
    type=string
  }

variable "cidr-for-test-public-sub2" {
    description = "public cidr"
    default = "10.0.102.0/24"
    type=string
  }

variable "Availability-Zone2" {
    description = "availability zone"
    default = "eu-west-2b"
    type=string
  }

variable "cidr-for-test-priv-sub1" {
    description = "private cidr"
    default = "10.0.110.0/24"
    type=string
  }

variable "Availability-Zone3" {
    description = "availability zone"
    default = "eu-west-2a"
    type=string
  }

variable "cidr-for-test-priv-sub2" {
    description = "private cidr"
    default = "10.0.111.0/24"
    type=string
  }

variable "Availability-Zone4" {
    description = "availability zone"
    default = "eu-west-2b"
    type=string
  }

variable "internet-gateway-association" {
    description = "association of internet gateway with route"
    default = "0.0.0.0/0"
    type=string
  }

variable "elastic-ip" {
    description = "elastic ip for NAT Gateway"
    default = "10.0.0.7"
    type=string
  }

 
variable "nat-gateway-destination-cidr-block" {
    description = "destination route for nat gateway"
    default = "0.0.0.0/0"
    type=string
  }
