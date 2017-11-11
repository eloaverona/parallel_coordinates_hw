## Parallel Coordinates

#### A visualization for the Topics in Visualization course at Macalester College Fall 2017
#### By Eloá França Verona and Ali Mahad


Our design was strongly influenced by the original Parallel Coordinates visualization http://mbostock.github.io/protovis/ex/cars.html.

<a href="https://ibb.co/eTfbSb"><img src="https://preview.ibb.co/jq0MtG/Full_Size_Render_5.jpg" alt="Full_Size_Render_5" border="0"></a>

We felt that it was easy to read and intuitive to interact with. We were particularly interested in the drag-and-filter approach of attributes on each y axis, and decided to incorporate the same approach. We also wanted to show various details-on-demand when their respected marks were hovered upon. An example of this would be individual lines showing label names of items, and instructions to reorder the axes when attribute names are hovered upon. We decided to use complement color combination of blue and yellow, that also takes into account color blindness. We also lowered transparency of each item line, which allows us to differentiate and see overlaps of multiple items on certain points. Our attribute name labels are alternatively positioned along the y axis because the cameras data has more columns and we wanted to avoid overlapping text. We also discussed if the axis should have minimum value of 0 or the minimum value of the attribute. We saw in class that to use the minimum value of the attribute could distort the users perception of the data. But some attributes have values that are very height and far from 0 (like year, and weight in the cars dataset). So to use 0 as the minimum would hinder the effectiveness of the visualization. So we decided to use the minimum value of the attribute.

#### Datasets used, and Running the code:
Our visualization runs code from either the cars dataset, or the cameras one. Cars is displayed by default, but if the boolean useCars (3rd line of parallel_coordinates) is set to false, cameras data is used. To view the visualization, run the code.

1- Hovering over along the first y axis highlights each individual item underneath in yellow. (Label) Names of these are displayed on the right side of the screen

<a href="https://ibb.co/m25qLw"><img src="https://preview.ibb.co/gtRKDG/Screen_Shot_2017_11_11_at_2_41_27_AM.png" alt="Screen_Shot_2017_11_11_at_2_41_27_AM" border="0"></a>

2- Hovering over attribute names at the bottom prompts us to press the left or right arrow key to switch the respected axis. For instance, in the example below, if right key on the keyboard is pressed, displacement wiill switch with horsepower. This way we can rearrange the attributes however we like. While we understand this is less intuitive than dragging and rearraging the axes, we believe this is a less visually confusing and faster approach than a choppy drag-and-drop in processing.

<a href="https://imgbb.com/"><img src="https://image.ibb.co/dUrrSb/Screen_Shot_2017_11_11_at_2_42_52_AM.png" alt="Screen_Shot_2017_11_11_at_2_42_52_AM" border="0"></a>

3- While our attribute filtering method is a little slow (we attribute this to processing as we could not find anything wrong with our code), the user will need to click and hold on the axes till the red box appears, drag it up or down, and hold for another second before releasing. While it may take some trials to filter the data, the feature does work. An example of what this would look like is shown below.

<a href="https://imgbb.com/"><img src="https://image.ibb.co/bSVJ7b/Screen_Shot_2017_11_11_at_2_42_30_AM.png" alt="Screen_Shot_2017_11_11_at_2_42_30_AM" border="0"></a>

A feature we realized we could include as a next step is a textbox showing the new min and max based on the user dragging up or down on the axis. Once the data has been filtered we could display it as a fixed label as is done in the original Parallel Coordinates visualization.
