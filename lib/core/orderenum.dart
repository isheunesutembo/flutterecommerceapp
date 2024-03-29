enum OrderStatus{
  pending('pending'), processing('processing') ,delivered('delivered'),accepted('accepted');
  const OrderStatus(this.status);
  final String status;
}
extension ConvertOrderStatus on String{
  OrderStatus toEnum(){
    switch(this){
      case 'pending':
      return OrderStatus.pending;
      case 'processing':
      return OrderStatus.processing;
      case 'delivered':
      return OrderStatus.delivered;
      case 'accepted':
      return OrderStatus.accepted;
      default:
      return OrderStatus.pending;


    }
  }
}