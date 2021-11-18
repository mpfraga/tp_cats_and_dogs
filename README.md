# tp_cats_and_dogs
Trabajo práctico de Actuación en Clase

Primero se construyeron las imagenes a partir de los Dockerfiles incluidos en la letra del trabajo. Se subieron manualmente a dos Repositorios de ECR uno llamado cats y uno llamado Dogs.
Para subirlos al repositorio se utilizaron los comandos  que ECR provee.
Se declararó el main.tf que contiene la información del provider.
Se claró networking.tf que contiene la creación de un VPC especifico, con su internet gateway, su default route table y dos subnets a y b en las zonas de disponibilidad
us-east-1a y us-east-1b, todos estos recursos llevaron el nombre de "animals_recurso".
En securitygroups.tf se declararon dos security groups, uno para el servicio de ECS y otro para el ALB. Estos abren el puerto 80 y en el caso del ECS, abre el 443 por
razones de funcionamiento.
Se declaran dos Load Balancers de tipo application con sus respectivos target groups y listeners.
En containers.tf se declaró un cluster para ambas aplicaciones, tambien se declararon dos task definitions para cada applicación con sus respectivas imagenes. 
Finalmente se declararon dos servicios, indicandole cada uno de los load balancers y de las task definitions.
