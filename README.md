# ft_services
A System Administration and Networking project

The project consists of setting up an infrastructure of different services. To do this, you
must use Kubernetes. You will need to set up a multi-service cluster.
Each service will have to run in a dedicated container.
Each container must bear the same name as the service concerned and for performance
reasons, containers have to be build using Alpine Linux.
Also, they will need to have a Dockerfile written by you which is called in the setup.sh.
You will have to build yourself the images that you will use. It is forbidden to take
already build images or use services like DockerHub.

<img width="550" alt="Screen Shot 2022-08-05 at 10 58 42 AM" src="https://user-images.githubusercontent.com/26097794/183054575-5064a17d-cab5-44f7-bf85-488bc1cb772f.png">

## Components
  Alpine Linux,
  Kubernetes,
  Docker,
  MetalLB,
  Nginx,
  FTPS,
  WordPress,
  phpMyAdmin,
  MariaDB (MySQL),
  Grafana,
  InfluxDB.

## How to use
``` setup.sh ```
