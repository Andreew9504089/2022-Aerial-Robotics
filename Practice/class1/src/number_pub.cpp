
#include "ros/ros.h"
#include "std_msgs/Int32.h"

using namespace std;
std_msgs::Int32 msg1;
std_msgs::Int32 msg2;
std_msgs::Int32 msg3;


int main(int argc, char **argv)
{
  cout << "initialize publish number" << endl;

  // you should rename your node and topic to avoid confliction
  ros::init(argc, argv, "number_pub");
  ros::NodeHandle n;
  ros::Publisher chatter_pub1 = n.advertise<std_msgs::Int32>("/number_1", 1000);
  ros::Publisher chatter_pub2 = n.advertise<std_msgs::Int32>("/number_2", 1000);
  ros::Publisher chatter_pub3 = n.advertise<std_msgs::Int32>("/number_3", 1000);
  ros::Rate loop_rate(10);

  int count = 0;
  while (ros::ok())
  {

    // Publish number data here
    msg1.data = 5;
    msg2.data = 2;
    msg3.data = 3;

    if (count == 0)
    {
      ROS_INFO("%d is published on /number_1", msg1.data);
      ROS_INFO("%d is published on /number_2", msg2.data);
      ROS_INFO("%d is published on /number_3", msg3.data);
    }

    chatter_pub1.publish(msg1);
    chatter_pub2.publish(msg2);
    chatter_pub3.publish(msg3);
    ros::spinOnce();

    loop_rate.sleep();
    ++count;



  }


  return 0;
}
