import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddProductToWishlist>(_onAddProductToWishlist);
    on<RemoveProductFromWishlist>(_onRemoveProductFromWishlist);
  }

  void _onLoadWishlist(event, emit) async {
    emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(const WishlistLoaded());
    } catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddProductToWishlist(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveProductFromWishlist(event, emit) {
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(
          WishlistLoaded(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(WishlistError());
      }
    }
  }
}
