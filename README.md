# Socio Economic and Demographic Trends in Florida Counties Tableau Dashboard

Tableau dashboard is available at the following link: [Dashboard](https://public.tableau.com/app/profile/polina.baikova5835/viz/Project_Polina_Baikova/Dashboard1)

# How to Explore the Dashboard:

**Hover for Additional Information:**

Hover over any county on the map or data points in charts to view detailed information, such as county name, population, crime rates, average home values, and other key statistics.

**Filter Data:**

Use the available filters to refine the data by factors such as year, school type, and county rankings, helping you focus on the most relevant information.

**Navigate to Detailed Insights:**

Click on any county in the map and select "Show me more details" to access more detailed information about that specific county. This will take you to the next dashboard with in-depth insights.

**Search for County Information Online:**

Click on any county in the map and select "Search online" option to quickly pull up relevant information about the selected county from Google.

**Return to the Main Dashboard:**

After exploring a specific county, click the "Back to Main Dashboard" option to return to the main page

# Data Preparation

Data from multiple sources was used to create the dashboard, including the data about the population from [U.S. Census Bureau](https://www.census.gov/data/tables/time-series/demo/popest/2020s-counties-total.html), housing prices data drawn from [Zillow’s Home Value Index](https://www.zillow.com/research/data/), crime rate data sourced from the [Florida Health Charts](https://www.flhealthcharts.gov/), political party affiliation data from the [Florida Department of Elections](https://dos.fl.gov/elections/data-statistics/voter-registration-statistics/voter-registration-reports/), restaurants data from the [Harvard Dataverse](https://dataverse.harvard.edu/), and data on school locations from [The Florida Geographic Data Library](https://fgdl.org/fgdlmap/). The data was cleaned and processed in R Studio using libraries such as tidyverse and dplyr. Key steps included standarding and cleaning column names, removing unnecessary rows and columns, and converting data formats to facilitate seamless integration. The precess involved reshaping datasets to a long format for better trend analysis, merging related datasets, and filtering data to focus on relevant geographic areas. After processing, the cleaned and structured datasets were saved in CSV format for easy access and visualization in Tableau. 

# Data Visualization

The goal of this project was to analyze county-level dynamics in Florida over recent years, focusing on key socioeconomic and demographic factors across the state. The primary objective was to create an interactive dashboard that provides users with valuable insights to make informed comparisons between counties. It can help identify emerging trends that could impact infrastructure planning, public safety measures, and economic strategies. Additionally, it can provide valuable insights into the long-term livability and development potential of each county, which can be particularly beneficial for potential homebuyers, enabling them to assess market conditions and determine whether a county offers a financially sound investment.

The dashboard provides an of key indicators such as population size, crime rates, and average home values. Users can select specific years to observe trends over time, with darker colors on the map representing higher values for each selected metric. Additionally, the map includes visual markers representing different types of schools, which can be filtered based on school type—such as elementary schools or colleges — allowing users to analyze the distribution of educational institutions. Hovering over these markers provides detailed information about each school, enabling users to assess their options in greater detail.

To facilitate meaningful comparisons, the dashboard highlights counties with the highest and lowest values for key indicators such as population size, crime rate, and home values. When users hover over these highlighted counties, their location is emphasized on the map, making it easy to identify them visually. Similarly, when exploring the map, any top-ranking counties are automatically highlighted in related visualizations. 

A scatter plot included in the dashboard provides further insights into county infrastructure by visualizing the number of schools and restaurants per 1,000 residents. The visualization reveals an interesting trend—counties with larger populations tend to have fewer schools and restaurants per capita compared to smaller counties, suggesting that infrastructure development may not be keeping pace with population growth. This insight could be crucial for individuals looking to relocate, as it highlights potential challenges related to access to services.

Interactivity is a key feature of the dashboard, enabling users to delve deeper into county-specific data. By selecting a county on the map, users have the option to search for additional information online. This feature allows them to view images, read articles, or explore demographic and economic details on external sources such as Wikipedia. Furthermore, users can navigate to a dedicated dashboard that provides a detailed breakdown of county-specific statistics, including how population, home values, and crime rates have changed over the years.

The county-specific dashboard also provides insights into the availability of various amenities. Users can analyze the distribution of different school types—such as public, private, and charter schools—as well as explore restaurant types and their prevalence within the county. In addition, the dashboard includes an analysis of political party affiliation trends over the past several years. This feature allows users to explore how political preferences have shifted within counties, providing an additional layer of insight for those interested in the political landscape of different areas.

Finally, users can navigate back to the main dashboard at any point and select a different county for further exploration. 

Overall, the dashboard serves as a comprehensive and user-friendly tool for analyzing county-level dynamics in Florida, offering insights that cater to a wide range of audiences, including families, investors, and policymakers. By leveraging interactive visualizations, users can explore trends, compare counties, and access relevant information to make data-driven decisions.

