import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bestvalue_offers.dart';
import '../widgets/drawer.dart';
import '../widgets/email_subscription.dart';
import '../widgets/events_carousel.dart';
import '../widgets/exclusive_deals.dart';
import '../widgets/footer.dart';
import '../widgets/offers_accommodations.dart';
import '../widgets/search_banner.dart';
import '../widgets/testimonial_comments.dart';
import '../widgets/toggle_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selected = 'Eventos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomToggleButton(
                        label: 'Eventos',
                        isSelected: selected == 'Eventos',
                        onTap: () {
                          setState(() {
                            selected = 'Eventos';
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomToggleButton(
                        label: 'Alojamiento',
                        isSelected: selected == 'Alojamiento',
                        onTap: () {
                          setState(() {
                            selected = 'Alojamiento';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //Banner
                  const HotelSearchBanner(),
                  //Carrusel Special Offers Acommodations
                  const AccommodationCarousel(),
                  //Carrusel Special Offers Future Events
                  const FeaturedEventsCarousel(),
                  //Best Value Offers
                  const BestValueOffers(),
                  //Exclusive Deals
                  const ExclusiveDeals(),
                  //Email
                  const EmailSubscriptionBox(),
                  //Comments
                  const SizedBox(height: 20),
                  const TestimonialCarousel(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
