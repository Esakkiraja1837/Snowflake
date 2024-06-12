-- Insert Table PROMOTION --

INSERT INTO T_PROMOTION 
    (PROMOTION_ID, CUSTOMER_CATEGORY, PROMOTION_TYPE, PROMOTION_VALUE, COMMENT) 
VALUES
    ('1001', 'gold', 'Discount', 5.00, 'PERCENT'),
    ('1002', 'silver', 'Discount', 3.00, 'PERCENT'),
    ('1003', 'bronze', 'Discount', 1.00, 'PERCENT'),
    ('1004', 'regular', 'Coupon_X', 0.03, 'AMOUNT'),
    ('1005', 'regular', 'Coupon_Y', 0.02, 'AMOUNT'),
    ('1006', 'regular', 'Coupon_Z', 0.01, 'AMOUNT'),
    ('1007', 'gold', 'Loyalty', 100.00, 'POINTS/1000 SPENT'),
    ('1008', 'silver', 'Loyalty', 50.00, 'POINTS/1000 SPENT'),
    ('1009', 'bronze', 'Loyalty', 30.00, 'POINTS/1000 SPENT');