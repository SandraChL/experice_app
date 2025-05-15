import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
import '../widgets/bar_search.dart';
import '../widgets/booking_summary.dart';
import '../widgets/date_location.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/hotel_detail_card.dart';
import '../widgets/rooms_card.dart';
import '../widgets/rooms_selector.dart';
import '../widgets/similar_hotel.dart';
import '../widgets/step_indicator.dart';
import '../widgets/terms_conditions.dart';
import '../widgets/trust_card.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isAtTop = _scrollController.offset <= 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomBarSearch(),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BookingSummaryCard(
              location: 'Cancún',
              dates: '2025-04-25 – 2025-04-26',
              occupancy: '1 room – 2 people',
            ),

            //Indicador de Pagina
            const SizedBox(height: 20),
            const StepIndicator(currentStep: 2),
            //Hoton return
            const BackButtonRounded(),
            //Tarjeta de Hotel detail
            const HotelDetailCard(),
            //Componente de Trust
            const TrustyouCard(),
            //Fechas y Localizacion
            DateAndLocationSelector(
              location: 'Cancún',
              onLocationPressed: () {
              },
            ),
            //Numero de Rooms
            const SizedBox(height: 20),
            RoomSelectorButton(
              roomsCount: 1,
              onPressed: () {
               
              },
            ),
            //Contenedor de Tarjetas de Rooms
            const SizedBox(height: 20),
            Container(
              height: 800,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.separated(
                itemCount: 5,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => const RoomCard(),
                separatorBuilder:
                    (context, index) => const SizedBox(height: 16),
              ),
            ),
            //Terminos y Condiciones
            const SizedBox(height: 20),
            const HotelPolicies(),
            //Similar Hotel
            const SizedBox(height: 20),
            const SimilarHotelsCarousel(),
            //Footer
            const SizedBox(height: 20),
            const FooterSection(),
          ],
        ),
      ),

      //Boton Flotante Inicio Fin pagina
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(
            _isAtTop ? Icons.expand_more : Icons.expand_less,
            color: Colors.black,
          ),
          onPressed: _isAtTop ? _scrollToBottom : _scrollToTop,
          tooltip: _isAtTop ? 'Ir al final' : 'Ir al principio',
        ),
      ),
    );
  }
}
