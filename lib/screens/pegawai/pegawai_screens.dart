import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:sipmas/provider/providers.dart';
import 'package:http/http.dart' as http;
import 'package:sipmas/screens/kadin/main_screen_kadin.dart';

import '../../api/api.dart';
import '../../decoration/decorations.dart';
import '../../model/models.dart';
import '../../widgets/widgets.dart';
import '../kadin/kadin_screens.dart';
import '../screens.dart';

part 'pegawai_home_screen.dart';
part 'main_screen_pegawai.dart';
part 'pegawai_profile_screen.dart';
part 'data_surat_pegawai_screen.dart';
