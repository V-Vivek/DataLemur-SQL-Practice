/*markdown
### Laptop vs. Mobile Viewership
Question Link: https://datalemur.com/questions/laptop-mobile-viewership
*/

SELECT
    (SELECT COUNT(*)
    FROM viewership
    WHERE device_type='laptop'
    )AS laptop_views,

    (SELECT COUNT(*)
    FROM viewership
    WHERE device_type IN ('tablet','phone')
    )AS mobile_views
    ;

/*markdown
Used nested *SELECT* statement
*/