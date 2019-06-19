data "external" "environment_scope" {
  program = ["${path.module}/environment_scope.sh"]

  query = {
    gitlab_environment_scope = "${var.gitlab_environment_scope}"
    google_project           = "${var.google_project}"
    cluster_name             = "${var.cluster_name}"
    namespace                = "${var.kubernetes_ns_info["name"]}"
  }
}

resource "gitlab_project_cluster" "gitlab_cluster" {
  project                       = "${var.gitlab_project_id}"
  name                          = "${var.cluster_name}"
  domain                        = "${var.cluster_base_domain}"
  enabled                       = "${var.enabled}"
  managed                       = "${var.cluster_managed}"
  kubernetes_api_url            = "https://${var.kubernetes_api_url}"
  kubernetes_token              = "${lookup(var.kubernetes_ns_ci_secret["data"], "token")}"
  kubernetes_ca_cert            = "${trimspace(base64decode(var.kubernetes_ca_cert))}"
  kubernetes_namespace          = "${var.kubernetes_ns_info["name"]}"
  kubernetes_authorization_type = "rbac"
  environment_scope             = "${data.external.environment_scope.result["environment_scope"]}"
}
