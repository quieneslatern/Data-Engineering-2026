-- Q: For the trips in November 2025 (lpep_pickup_datetime between '2025-11-01' and '2025-12-01', exclusive of the upper bound), how many trips had a trip_distance of less than or equal to 1 mile?
 
select count(1)
from green_tripdata_2025_11 t
where t.lpep_pickup_datetime between '2025-11-01' and '2025-12-01'
  and t.trip_distance <= 1
limit 100;

-- A: 8007

-- Q: Which was the pick up day with the longest trip distance? 
-- Only consider trips with trip_distance less than 100 miles (to exclude data errors).
-- Use the pick up time for your calculations.

select t.lpep_pickup_datetime::date as pickup_day, max(t.trip_distance) as max_trip_distance
from green_tripdata_2025_11 t
where t.trip_distance < 100
group by pickup_day
order by max_trip_distance desc;

-- A: 2025-11-14

-- Q: Which was the pickup zone with the largest total_amount (sum of all trips) on November 18th, 2025?

select t.PULocationID, tzl.Zone, sum(t.total_amount) as total_amount
from green_tripdata_2025_11 t
join taxi_zone_lookup tzl on t.PULocationID = tzl.LocationID
where t.lpep_pickup_datetime::date = '2025-11-18'
group by t.PULocationID, tzl.Zone
order by total_amount desc
limit 100;

-- A: East Harlem North (74)

-- Q: For the passengers picked up in the zone named "East Harlem North" in November 2025, which was the drop off zone that had the largest tip?
-- Note: it's tip , not trip. We need the name of the zone, not the ID.

select tzl.Zone as pickup_zone, t.tip_amount as max_tip, tzl2.Zone as dropoff_zone
from green_tripdata_2025_11 t
join taxi_zone_lookup tzl on t.PULocationID = tzl.LocationID
  and tzl.Zone = 'East Harlem North'
join taxi_zone_lookup tzl2 on t.DOLocationID = tzl2.LocationID
order by t.tip_amount desc 
limit 100;

-- A: Yorkville West

