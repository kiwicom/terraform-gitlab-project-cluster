variable "cluster_name" {
}

variable "gitlab_project_id" {
}

variable "gitlab_environment_scope" {
  description = "One of 'gitlab_environment_scope' or 'google_project' has to be specified."
  default     = ""
}

variable "google_project" {
  description = "One of 'gitlab_environment_scope' or 'google_project' has to be specified."
  default     = ""
}

variable "cluster_base_domain" {
  default = "dummy.set.in.infra.repo.example.com"
}

variable "kubernetes_api_url" {
}

variable "kubernetes_ca_cert" {
}

variable "kubernetes_ns_info" {
  type = map(string)
}

variable "kubernetes_authorization_type" {
  default = "rbac"
}

variable "enabled" {
  default = true
}

variable "kubernetes_ns_ci_secret" {
  type = map(map(string))
}

variable "cluster_managed" {
  default = false
}
