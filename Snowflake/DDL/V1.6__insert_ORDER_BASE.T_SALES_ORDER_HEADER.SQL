-- Insert Table SALES ORDER HEADER --

INSERT INTO T_SALES_ORDER_HEADER 
    (ORDER_ID, ORDER_DATE, STATUS, CUSTOMER_ID, COUPON_CODE, CREATE_DATE, CREATE_USER) 
VALUES
    ('ORD08', '2024-05-31', 'open', 'CUST01', 'Coupon_X', CURRENT_DATE, 'USER1'),
    ('ORD01', '2024-05-28', 'Close', 'CUST02', 'Discount', CURRENT_DATE, 'USER2'),
    ('ORD03', '2024-05-25', 'open', 'CUST03', 'Discount', CURRENT_DATE, 'USER3'),
    ('ORD04', '2024-05-29', 'open', 'CUST04', 'Discount', CURRENT_DATE, 'USER1'),
    ('ORD05', '2024-05-28', 'Close', 'CUST08', 'Coupon_X', CURRENT_DATE, 'USER2'),
    ('ORD06', '2024-05-25', 'open', 'CUST09', 'Coupon_Y', CURRENT_DATE, 'USER3');