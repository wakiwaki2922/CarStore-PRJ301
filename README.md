# CarStore-PRJ301
# I. Tổng quan
## 1. Giới thiệu
## 2. Cơ sở dữ liệu
## 3. Chức năng hệ thống

# II. Yêu cầu chức năng

## I. Tổng quan
### 1. Giới thiệu
Dự án của tôi là một trang web bán xe. Có 2 vai trò chính: Khách hàng và Quản lý. Khi đăng nhập với vai trò Khách hàng, bạn có thể xem danh sách xe có sẵn, có thể mua sắm bằng cách đưa sản phẩm vào giỏ hàng và sau đó thanh toán. Khi đăng nhập với vai trò Quản lý, bạn có thể xem Hóa đơn (tìm kiếm), tất cả các tài khoản khách hàng (xem, cập nhật, xóa), chi tiết của mỗi hóa đơn (xem, sắp xếp), quản lý xe của quản lý (thêm, cập nhật, xóa).

### 2. Cơ sở dữ liệu
- Tên Cơ sở dữ liệu: StoreManagement
- Bảng Tài khoản
  ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/4bc91fee-a267-4185-9523-8050a676d018)
- Bảng Sản phẩm
  ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/b9889cf4-5615-4735-bd31-fb991eb3d144)
- Bảng Đơn hàng
  ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/e8b69a22-9a34-4bdf-a1f9-3ddf4512e4b7)
- Bảng Chi tiết đơn hàng
  ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/7572e545-eab8-477c-890e-f2480f16e9bf)

### 3. Chức năng hệ thống
![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/806e9235-7af3-4b00-9a30-6bb6ca80209e)

#### Ứng dụng Web cho Người dùng
| STT | Tính năng | Màn hình | Mô tả |
| --- | --------- | --------- | ----- |
| 1   | Đăng nhập | Trang Đăng nhập | Bao gồm hộp văn bản để nhập tên người dùng và mật khẩu, nút đăng nhập, nút đặt lại và liên kết đăng ký. |
| 2   | Đăng ký   | Trang Đăng ký | Bao gồm hộp văn bản để nhập thông tin người dùng, nút đăng ký, nút đặt lại. |
| 3   | Xem hồ sơ khách hàng | Trang Khách hàng | Hiển thị hồ sơ của khách hàng: thông tin cá nhân và nút để chuyển đến trang mua sắm. |
| 4   | Chỉnh sửa hồ sơ | Trang Chỉnh sửa | Chứa hộp văn bản để cập nhật thông tin khách hàng. |
| 5   | Mua sắm    | Trang Mua sắm | Hiển thị tất cả sản phẩm cho khách hàng để chọn mua. |
| 6   | Thêm vào giỏ hàng | Trang Mua sắm | Cho phép khách hàng thêm sản phẩm vào giỏ hàng. |
| 7   | Thanh toán | Trang Thanh toán | Xem tất cả sản phẩm đang chờ thanh toán, xem xét số lượng hoặc loại bỏ một số sản phẩm trước khi thanh toán. |

#### Ứng dụng Quản lý
| STT | Tính năng | Màn hình | Mô tả |
| --- | --------- | --------- | ----- |
| 8   | Trang chủ quản lý | Trang Quản lý | Quản trị viên có thể xem đơn đặt hàng (có thể tìm kiếm theo ngày mong muốn giao hàng), quản lý người dùng (xóa, chỉnh sửa), quản lý xe (thêm, xóa, chỉnh sửa). |
| 9   | Quản lý Khách hàng | Trang Quản lý | Xem tất cả tài khoản khách hàng và thực hiện các thao tác xem, cập nhật, xóa. |
| 10  | Quản lý Sản phẩm | Trang Quản lý | Xem tất cả các sản phẩm và thực hiện các thao tác thêm, xóa, chỉnh sửa. |
| 11  | Quản lý Hóa đơn | Trang Quản lý | Xem tất cả hóa đơn và thực hiện các thao tác xem, sắp xếp. |
| 12  | Thêm sản phẩm | Trang Quản lý | Thêm sản phẩm mới vào cơ sở dữ liệu. |
| 13  | Chỉnh sửa hồ sơ người dùng | Trang Quản lý | Chỉnh sửa thông tin hồ sơ người dùng. |
| 14  | Chỉnh sửa hồ sơ quản lý | Trang Quản lý | Chỉnh sửa thông tin hồ sơ quản lý. |

## II. Yêu cầu chức năng
1. **Chào mừng**
   ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/b59b9046-1545-4aa5-b747-be758513f891)
2. **Đăng nhập**
  ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/ee66e94e-9a78-46e5-adb3-acb4e1dedee1)
3. **Đăng ký**
   ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/92265816-314e-4103-beca-4660a4ee7bc1)
4. **Hồ sơ**
   ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/744a1d21-7f64-4376-82bf-5d1a356f1e24)
5. **Mua sắm**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/5117978d-4f8a-48a8-b8cb-89fef48b7ea3)
6. **Thêm vào giỏ hàng**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/d19a75ac-99dd-4bea-a453-beb876f41e0e)
7. **Thanh toán**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/06b8c458-c8d3-4d32-8d59-0f308510a445)
8. **Thanh toán thành công**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/19db2557-9c27-4f9c-8e2b-7ff301f745c1)
9. **Trang chủ quản lý**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/2254c633-6e9b-462d-b850-433d69eb3fc2)
10. **Quản lý Khách hàng**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/ed811091-091e-4cd4-be5f-acea73de4438)
11. **Quản lý Sản phẩm**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/816dfad4-61ac-44fe-a6be-a152c728e124)
12. **Quản lý Hóa đơn**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/157218a9-9a89-4ec4-a9ce-adfe429405bb)
13. **Thêm sản phẩm**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/5eaa9d81-799c-422f-bcce-8f576a0bdacd)
14. **Chỉnh sửa hồ sơ người dùng**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/4fb0eaa7-3145-434f-8f50-a37e10fa4e2a)
15. **Chỉnh sửa hồ sơ quản lý**
    ![image](https://github.com/wyzem4n/CarStore-PRJ301/assets/121012229/e3c85758-4f3f-4ce0-9822-5b5719170ce4)
