provider "kubernetes" {
config_context_cluster = "minikube"
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "myreplica"
    labels = {
      test = "Myweb"
    }
  }

spec {
    replicas = 2

    selector {
      match_expressions {
        key = "dc"
        operator = "In"
        values = ["The_wall" , "North"] 
}     
    }


    template {
      metadata {
        labels = {
          dc = "The_wall"
        }
      }

      spec {
        container {
          image = "vimal13/apache-webserver-php"
          name  = "rcweb"

        }
      }
    }
  }
}