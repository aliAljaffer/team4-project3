resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  set = [{
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path"
    value = "/healthz" # importantttt!!!! for healthy app gateway
    },
    {
      name  = "controller.service.externalTrafficPolicy"
      value = "Local"
    },
    {
      name  = "controller.ingressClassResource.name"
      value = "nginx"
    },
    {
      name  = "controller.ingressClassResource.controllerValue"
      value = "k8s.io/ingress-nginx"
    },
    {
      name  = "controller.service.type"
      value = "LoadBalancer"
    },
    {
      name  = "controller.resources.requests.cpu"
      value = "100m"
    }
    , {
      name  = "controller.resources.requests.memory"
      value = "128Mi"
    }

    , {
      name  = "controller.resources.limits.cpu"
      value = "500m"
    }

    , {
      name  = "controller.resources.limits.memory"
      value = "512Mi"
  }]
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  version          = "v1.19.1"
  set = [{
    name  = "installCRDs"
    value = "true"
    },
    {
      name  = "global.leaderElection.namespace"
      value = "cert-manager"
  }]
}
