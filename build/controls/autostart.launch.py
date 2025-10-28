from launch import LaunchDescription, LaunchService
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory
import os


def generate_launch_description():
    mobility_config = os.path.join(
        get_package_share_directory('mobility_controller'),
        'config', 'mobility_controller_usb.yaml'
    )
    manipulator_config = os.path.join(
        get_package_share_directory('manipulator_controller'),
        'config', 'manipulator_controller_usb.yaml'
    )
    ds4_config = os.path.join(
        get_package_share_directory('rover_teleoperation'),
        'config', 'ds4_config.yaml'
    )

    mobility_controller = Node(
        package='mobility_controller',
        executable='mobility_controller',
        name='mobility_controller',
        output='screen',
        parameters=[mobility_config],
    )

    manipulator_controller = Node(
        package='manipulator_controller',
        executable='manipulator_controller',
        name='manipulator_controller',
        output='screen',
        parameters=[manipulator_config],
    )

    ds4_receiver = Node(
        package='rover_teleoperation',
        executable='joy_receiver',
        name='joy_receiver',
        output='screen',
        parameters=[ds4_config],
    )

    return LaunchDescription([
        DeclareLaunchArgument('use_control_usb', default_value='true'),
        DeclareLaunchArgument('use_ds4', default_value='true'),
        mobility_controller,
        manipulator_controller,
        ds4_receiver
    ])


if __name__ == '__main__':
    ld = generate_launch_description()
    ls = LaunchService()
    ls.include_launch_description(ld)
    ls.run()
