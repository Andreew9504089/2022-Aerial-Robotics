#include "ros/ros.h"
#include <turtlesim/Spawn.h>
#include <turtlesim/Kill.h>
#include <string>
#include <iostream>

using namespace std;


int main(int argc, char **argv)
{
    ros::init(argc, argv, "spawnturtles");
    ros::NodeHandle n;

    // Check if the service is on
    ros::service::waitForService("/turtlesim/spawn");

    // initialize kill turtle service
    ros::ServiceClient client_kill=n.serviceClient<turtlesim::Kill>("/turtlesim/kill");
    turtlesim::Kill kill_name;
    // define parameters in service
    kill_name.request.name = "turtle1";
    // call the service
    client_kill.call(kill_name); 


    // initialize spawn turtle service
    ros::ServiceClient client_spawn = n.serviceClient<turtlesim::Spawn>("/turtlesim/spawn");
    turtlesim::Spawn turtle;

    // Finish your code, you will need to spawn turtles
    char name[][20]{"turtle1", "turtle2", "turtle3", "turtle4"};

    for(int i = 0; i < 4; i++)
    {
        turtlesim::Spawn turtle;
        turtle.request.name = name[i];
        turtle.request.x = 2 * i + 2;
        turtle.request.y = 2 * i + 2;
        client_spawn.call(turtle);
    }





    

}