
variable "binarylane_email" {
  description = "Email Address/User used to login to the Openstack api for binarylane."
  default = "email@emai.com"
}

variable "binarylane_api_key" {
  description = "API key used to login/verify for openstack APIs used at binarylane."
  default = "32characterkey"
}
variable "github_api_key" {
    description = "API key used to pull packages down from github packages"
    default     =   "demo"
}


