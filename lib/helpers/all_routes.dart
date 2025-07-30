import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:quran_app/features/account-management/account_management/presentation/account_management_screen.dart';
import 'package:quran_app/features/account-management/additional_customization_support/presentation/additional_customization_support_screen.dart';
import 'package:quran_app/features/account-management/change_font/presentation/change_font_screen.dart';
import 'package:quran_app/features/account-management/change_password/presentation/change_password_screen.dart';
import 'package:quran_app/features/account-management/daily_quran_goal/presentation/daily_quran_goal_screen.dart';
import 'package:quran_app/features/account-management/delete_account/presentation/delete_account_screen.dart';
import 'package:quran_app/features/account-management/font_size/presentation/font_size_screen.dart';
import 'package:quran_app/features/account-management/language/presentation/language_screen.dart';
import 'package:quran_app/features/account-management/notification_reminder_settings/presentation/notification_reminder_settings_screen.dart';
import 'package:quran_app/features/account-management/reading_mode/presentation/reading_mode_screen.dart';
import 'package:quran_app/features/account-management/reciters/presentation/reciters_screen.dart';
import 'package:quran_app/features/account-management/settings/presentation/settings_screen.dart';
import 'package:quran_app/features/account-management/tafsir_signup/presentation/tafsir_signup_screen.dart';
import 'package:quran_app/features/account-management/theme/presentation/theme_screen.dart';
import 'package:quran_app/features/achivement/presentation/achivement_screen.dart';
import 'package:quran_app/features/audio_quran/al_fatihah/presentation/al_fatiha_screen.dart';
import 'package:quran_app/features/audio_quran/presentation/audio_quran_screen.dart';
import 'package:quran_app/features/auth/create_account/presentation/create_account_screen.dart';
import 'package:quran_app/features/auth/forgot_password/presentation/forgot_otp_verification.dart';
import 'package:quran_app/features/auth/forgot_password/presentation/forgot_password_screen.dart';
import 'package:quran_app/features/auth/forgot_password/presentation/reset_password_screen.dart';
import 'package:quran_app/features/auth/login/presentation/login_screen.dart';
import 'package:quran_app/features/auth/sign_up/presentation/signup_screen.dart';
import 'package:quran_app/features/button_navigationbar.dart';
import 'package:quran_app/features/community/community/presentation/community_screen.dart';
import 'package:quran_app/features/community/community_new_post/presentation/community_new_post_screen.dart';
import 'package:quran_app/features/home_screen/presentation/home_screen.dart';
import 'package:quran_app/features/leaderboard/leaderboard/presentation/leaderboard_screen.dart';
import 'package:quran_app/features/learning/learning_one/presentation/learning_one_screen.dart';
import 'package:quran_app/features/mind_map/mind_map/presentation/mind_map_screen.dart';
import 'package:quran_app/features/mind_map/mind_map_share/presentation/mind_map_share_screen.dart';
import 'package:quran_app/features/news/presentation/news_screen.dart';
import 'package:quran_app/features/personalization_flow/%20preferred_font_size/presentation/preferred_font_size_screen.dart';
import 'package:quran_app/features/personalization_flow/calligraphy_style/presentation/calligraphy_style_screen.dart';
import 'package:quran_app/features/personalization_flow/like_to_quran/presentation/like_to_quran_screen.dart';
import 'package:quran_app/features/personalization_flow/select_color_them_background/presentation/select_color_them_background_screen.dart';
import 'package:quran_app/features/personalization_flow/select_qari_for_recitation/presentation/select_qari_for_recitation_screen.dart';
import 'package:quran_app/features/personalization_flow/select_tafsir_understanding/presentation/select_tafsir_understanding_screen.dart';
import 'package:quran_app/features/personalization_flow/sign_up_preferred_language/presentation/preferred_language_screen.dart';
import 'package:quran_app/features/profile/edit_profile/presentation/edit_profile_screen.dart';
import 'package:quran_app/features/profile/profile/presentation/profile_screen.dart';
import 'package:quran_app/features/quran_academy/quran_academy_screen/presentation/quran_academy_screen.dart';
import 'package:quran_app/features/quran_academy/quran_in_english/quran_in_english_list/presentation/quran_in_english_list_screen.dart';
import 'package:quran_app/features/quran_academy/quran_in_english/quran_opening_play/presentation/quran_opening_play_screen.dart';
import 'package:quran_app/features/read_quran_juz/jus_display_setting/presentation/jus_display_setting_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_quran/presentation/read_quran_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_scroll_style/presentation/read_surah_scroll_style_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_setting/presentation/read_surah_setting_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_verse_by_verse/presentation/read_surah-verse_by_verse_screen.dart';
import 'package:quran_app/features/read_quran_surah/read_surah_word_for_word/presentation/read_surah_word_for_word_screen.dart';
import 'package:quran_app/features/read_quran_surah/search_for_word/presentation/search_for_word_screen.dart';
import 'package:quran_app/features/read_quran_surah/tafsir/presentation/tafsir_screen.dart';
import 'package:quran_app/features/vocabulary/alphabet/presentation/alphabet_screen.dart';
import 'package:quran_app/features/vocabulary/learn/presentation/learn_screen.dart';
import 'package:quran_app/features/vocabulary/learn/write/presentation/write_screen.dart';
import 'package:quran_app/features/vocabulary/learn_tajweed/presentation/learn_tajweed_screen.dart';
import 'package:quran_app/features/vocabulary/learn_tajweed_lesson/presentation/learn_tajweed_lesson_screen.dart';
import 'package:quran_app/features/vocabulary/letter/presentation/letter_screen.dart';
import 'package:quran_app/features/vocabulary/vocabulary_tajweed/presentation/vocabulary_screen.dart';
import '../features/news/presentation/gibla_screen.dart';
import '../features/read_quran_juz/juz_english_translation/presentation/juz_english_translation_screen.dart';


final class Routes {
  static final Routes _routes = Routes._internal();

  Routes._internal();

  static Routes get instance => _routes;

  ///===================Authentication Routes========================
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  //-------------------------- Language ------------------------------//
  static const String preferredLanguageScreen = '/preferredLanguageScreen';
  static const String calligraphyStyleScreen = '/calligraphyStyleScreen';
  static const String preferredFontSizeScreen = '/preferredFontSizeScreen';
  static const String selectQariForRecitationScreen = '/selectQariForRecitationScreen';
  static const String selectTafsirUnderstandingScreen = '/selectTafsirUnderstandingScreen';
  static const String selectColorThemBackgroundScreen = '/selectColorThemBackgroundScreen';
  static const String likeToQuranScreen = '/likeToQuranScreen';
  static const String homeScreen = '/homeScreen';
  static const String readQuranSurahScreen = '/readQuranSurahScreen';
  static const String searchForWordScreen = '/searchForWordScreen';
  static const String readSurahVerseScreen = '/readSurahVerseScreen';
  static const String readSurahverseScreen = '/readSurahverseScreen';
  static const String readSurahWordForWordScreen = '/readSurahWordForWordScreen';
  static const String readSurahScrollStyleScreen = '/readSurahScrollStyleScreen';
  static const String jusDisplaySettingScreen = '/jusDisplaySettingScreen';
  static const String readSurahSettingScreen = '/readSurahSettingScreen';
  static const String createAccountScreen = '/createAccountScreen';
  static const String quranAcademyScreen = '/quranAcademyScreen';
  static const String quranInEnglishListScreen = '/quranInEnglishListScreen';
  static const String quranOpeningPlayScreen = '/quranOpeningPlayScreen';
  ///============================Bottom Navigation Bar===============
  static const String bottomNavBar = '/bottomNavBar';
  static const String mainBottomNavScreen = '/mainBottomNavScreen';
  static const String tafsirScreen = '/tafsirScreen';
  static const String forgotOtpVerificationScreen = '/forgotOtpVerificationScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String juzEnglishTranslationScreen = '/juzEnglishTranslationScreen';
  static const String mindMapScreen = '/mindMapScreen';
  static const String learnTajweedScreen = '/learnTajweedScreen';
  static const String communityScreen = '/communityScreen';
  static const String communityNewPostScreen = '/communityNewPostScreen';
  static const String learnTajweedLessonScreen = '/learnTajweedLessonScreen';
  static const String vocabularyScreen = '/vocabularyScreen';
  static const String alphabetScreen = '/alphabetScreen';
  static const String letterScreen = '/letterScreen';
  static const String readSurahVerseByVerseScreen = '/readSurahVerseByVerseScreen';
  static const String learnScreen = '/learnScreen';
  static const String writeScreen = '/writeScreen';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String leaderboardScreen = '/leaderboardScreen';
  static const String achivementScreen = '/achivementScreen';
  static const String accountManagementScreen = '/accountManagementScreen';
  static const String dailyQuranGoalScreen = '/dailyQuranGoalScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String changeFontScreen = '/changeFontScreen';
  static const String fontSizeScreen = '/fontSizeScreen';
  static const String recitersScreen = '/recitersScreen';
  static const String languageScreen = '/languageScreen';
  static const String tafsirSignUpScreen = '/tafsirSignUpScreen';
  static const String readingModeScreen = '/readingModeScreen';
  static const String themeScreen = '/themeScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String deleteAccountScreen = '/deleteAccountScreen';
  static const String additionalCustomizationSupportScreen = '/additionalCustomizationSupportScreen';
  static const String notificationReminderSettingsScreen = '/notificationReminderSettingsScreen';
  static const String learningOneScreen = '/learningOneScreen';
  static const String newsScreen = '/newsScreen';
  static const String mindMapShareScreen = '/mindMapShareScreen';
  static const String giblaScreen = '/giblaScreen';
  static const String audioQuranScreen = '/audioQuranScreen';
  static const String alFatihaScreen = '/alFatihaScreen';

  //===========================







}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();

  RouteGenerator._internal();

  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    ///===================Authentication Routes========================
    ///
    ///
    ///
    ///
    ///
      case Routes.loginScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LoginScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LoginScreen());
        }
      case Routes.audioQuranScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AudioQuranScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AudioQuranScreen());
        }


//=============================================================================================//





      case Routes.signUpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SignUpScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SignUpScreen());
        }


      case Routes.createAccountScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: CreateAccountScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => CreateAccountScreen());
        }

      case Routes.alFatihaScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AlFatihaScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AlFatihaScreen());
        }

      case Routes.forgotOtpVerificationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ForgotOtpVerificationScreen(email: ''), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ForgotOtpVerificationScreen(email: ''));
        }
      case Routes.forgetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ForgetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ForgetPasswordScreen());
        }
      case Routes.resetPasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ResetPasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ResetPasswordScreen());
        }
    /// ------------------------------ Home -----------------------------//
      case Routes.homeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: HomeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => HomeScreen());
        }
    /// ------------------------------ Language -----------------------------//
      case Routes.preferredLanguageScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: PreferredLanguageScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => PreferredLanguageScreen());
        }
      case Routes.calligraphyStyleScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: CalligraphyStyleScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => CalligraphyStyleScreen());
        }
      case Routes.preferredFontSizeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: PreferredFontSizeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => PreferredFontSizeScreen());
        }
      case Routes.selectQariForRecitationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SelectQariForRecitationScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SelectQariForRecitationScreen());
        }
      case Routes.selectTafsirUnderstandingScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SelectTafsirUnderstandingScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SelectTafsirUnderstandingScreen());
        }
      case Routes.selectColorThemBackgroundScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SelectColorThemBackgroundScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SelectColorThemBackgroundScreen());
        }
      case Routes.likeToQuranScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LikeToQuranScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LikeToQuranScreen());
        }
    /// ------------------------------ Quran Academy -----------------------------//
      case Routes.quranAcademyScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: QuranAcademyScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => QuranAcademyScreen());
        }


      case Routes.quranInEnglishListScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: QuranInEnglishListScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => QuranInEnglishListScreen());
        }

        case Routes.languageScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LanguageScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LanguageScreen());
        }

        case Routes.giblaScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: GiblaScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => GiblaScreen());
        }





      case Routes.quranOpeningPlayScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: QuranOpeningPlayScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => QuranOpeningPlayScreen());
        }


      case Routes.mindMapShareScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MindMapShareScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => MindMapShareScreen());
        }




      case Routes.readQuranSurahScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadQuranSurahScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadQuranSurahScreen());
        }

      case Routes.searchForWordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SearchForWordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SearchForWordScreen());
        }


      case Routes.readSurahverseScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadSurahVerseByVerseScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadSurahVerseByVerseScreen());
        }
      case Routes.readSurahWordForWordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadSurahWordForWordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadSurahWordForWordScreen());
        }

      case Routes.readSurahScrollStyleScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadSurahScrollStyleScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadSurahScrollStyleScreen());
        }


      case Routes.mindMapScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: MindMapScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => MindMapScreen());
        }


      case Routes.learnTajweedScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LearnTajweedScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LearnTajweedScreen());
        }


      case Routes.communityScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: CommunityScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => CommunityScreen());
        }

      case Routes.communityNewPostScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: CommunityNewPostScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => CommunityNewPostScreen());
        }



        case Routes.learnTajweedLessonScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LearnTajweedLessonScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LearnTajweedLessonScreen());
        }


        case Routes.vocabularyScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: VocabularyScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => VocabularyScreen());
        }

        case Routes.alphabetScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AlphabetScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AlphabetScreen());
        }



        case Routes.letterScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LetterScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LetterScreen());
        }

        case Routes.readSurahVerseByVerseScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadSurahVerseByVerseScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadSurahVerseByVerseScreen());
        }


        case Routes.learnScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LearnScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LearnScreen());
        }



        case Routes.writeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: WriteScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => WriteScreen());
        }



        case Routes.profileScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ProfileScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ProfileScreen());
        }


        case Routes.editProfileScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: EditProfileScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => EditProfileScreen());
        }

        case Routes.leaderboardScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LeaderboardScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LeaderboardScreen());
        }

        case Routes.achivementScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AchivementScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AchivementScreen());
        }

        case Routes.accountManagementScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AccountManagementScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AccountManagementScreen());
        }

        case Routes.dailyQuranGoalScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: DailyQuranGoalScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => DailyQuranGoalScreen());
        }

        case Routes.settingsScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: SettingsScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => SettingsScreen());
        }


        case Routes.changeFontScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ChangeFontScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ChangeFontScreen());
        }

        case Routes.fontSizeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: FontSizeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => FontSizeScreen());
        }

        case Routes.recitersScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: RecitersScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => RecitersScreen());
        }





       case Routes.tafsirSignUpScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: TafsirSignUpScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => TafsirSignUpScreen());
        }


       case Routes.readingModeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadingModeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadingModeScreen());
        }

       case Routes.themeScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ThemeScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ThemeScreen());
        }

       case Routes.changePasswordScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ChangePasswordScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ChangePasswordScreen());
        }

       case Routes.deleteAccountScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: DeleteAccountScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => DeleteAccountScreen());
        }


       case Routes.additionalCustomizationSupportScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: AdditionalCustomizationSupportScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => AdditionalCustomizationSupportScreen());
        }

       case Routes.notificationReminderSettingsScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: NotificationReminderSettingsScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => NotificationReminderSettingsScreen());
        }

       case Routes.learningOneScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: LearningOneScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => LearningOneScreen());
        }

       case Routes.newsScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: NewsScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => NewsScreen());
        }












      case Routes.jusDisplaySettingScreen:
        final bool initialIsOn = settings.arguments as bool? ?? false;
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
            widget: JusDisplaySettingScreen(initialIsOn: initialIsOn),
            settings: settings,
          );
        } else {
          return CupertinoPageRoute(
            builder: (context) => JusDisplaySettingScreen(initialIsOn: initialIsOn),
          );
        }







      case Routes.readSurahSettingScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: ReadSurahSettingScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => ReadSurahSettingScreen());
        }


      case Routes.tafsirScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: TafsirScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => TafsirScreen());
        }
      case Routes.juzEnglishTranslationScreen:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: JuzEnglishTranslationScreen(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => JuzEnglishTranslationScreen());
        }
    ///===================Bottom Navigation Routes========================
      case Routes.bottomNavBar:
        if (Platform.isAndroid) {
          return FadedTransitionRoute(
              widget: BottomNavBar(), settings: settings);
        } else {
          return CupertinoPageRoute(
              builder: (context) => BottomNavBar());
        }
      default:
        return null;
    }
  }
}

class FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  FadedTransitionRoute({required this.widget, required this.settings})
      : super(
    settings: settings,
    reverseTransitionDuration: const Duration(milliseconds: 1),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionDuration: const Duration(milliseconds: 1),
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        ),
        child: child,
      );
    },
  );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}