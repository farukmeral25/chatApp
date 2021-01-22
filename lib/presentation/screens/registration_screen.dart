import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:flutter_chat_app/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_chat_app/presentation/pages/phone_verification_page.dart';
import 'package:flutter_chat_app/presentation/pages/set_initial_profile_page.dart';
import 'package:flutter_chat_app/presentation/screens/home_screen.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredCountry =
      CountryPickerUtils.getCountryByPhoneCode("92");
  String _countryCode = _selectedFilteredCountry.phoneCode;
  String _phoneNumber = "";
  TextEditingController _phoneAuthController = TextEditingController();

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  void _submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneAuthController.text}";
      BlocProvider.of<PhoneAuthCubit>(context).submitVerifyPhoneNumber(
        phoneNumber: _phoneNumber,
      );
    }
    print("Submit Verify Phone Number");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        builder: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthSmsCodeReceived) {
            return PhoneVerificationPage(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthProfileInfo) {
            return SetInitialProfilePage(
              phoneNumber: _phoneNumber,
            );
          }
          if (phoneAuthState is PhoneAuthLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (phoneAuthState is PhoneAuthSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomeScreen(
                    uid: authState.uid,
                  );
                }
                return Container();
              },
            );
          }
          return _bodyWidget();
        },
        listener: (context, phoneAuthState) {
          if (phoneAuthState is PhoneAuthSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (phoneAuthState is PhoneAuthFailure) {
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Something is wrong",
                      ),
                      Icon(Icons.error_outline),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                    fontSize: 18,
                    color: greenColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "This is a messaging application. It is still under construction and has no commercial purpose.",
              style: TextStyle(fontSize: 16),
            ),
            ListTile(
              onTap: _openFilteredCountryPickerDialog,
              title: _buildDialogItem(_selectedFilteredCountry),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: greenColor),
                    ),
                  ),
                  width: 80,
                  alignment: Alignment.center,
                  height: 42,
                  child: Text(
                    "${_selectedFilteredCountry.phoneCode}",
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: _submitVerifyPhoneNumber,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openFilteredCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (_) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: primaryColor,
        ),
        child: CountryPickerDialog(
          titlePadding: EdgeInsets.all(8.0),
          searchCursorColor: Colors.black,
          searchInputDecoration: InputDecoration(
            hintText: "Search",
          ),
          title: Text("Select your phone code"),
          isSearchable: true,
          onValuePicked: (Country country) {
            setState(() {
              _selectedFilteredCountry = country;
              _countryCode = country.phoneCode;
            });
          },
          itemBuilder: _buildDialogItem,
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            height: 8.0,
          ),
          Text("+${country.phoneCode}"),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "${country.name}",
            style: TextStyle(letterSpacing: 0),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
