// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:screl_campaign_app/core/db/shared/sharedpref.dart';
// import 'package:screl_campaign_app/screens/step_screen.dart';
// import 'package:screl_campaign_app/state/panel/panel_state_provider.dart';
// import 'package:screl_campaign_app/state/step/step_state_provider.dart';
// import 'package:screl_campaign_app/state/switch/switch_state_provider.dart';

// class HomeScreen2 extends ConsumerWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
// // ------
//   void GetData() async {
//     final a = await GetSharedPreferences.getCampaign();
//     final b = await GetSharedPreferences.getPreview();
//         final c = await GetSharedPreferences.getName();
//             final d = await GetSharedPreferences.getEmail();


//     print(a ?? 'No access token found');
//      print(b ?? 'No access token found');
//       print(c ?? 'No access token found');
//        print(d ?? 'No access token found');
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//      final campaignController = TextEditingController();
//     final previewController = TextEditingController();
//     final nameController = TextEditingController();
//     final emailController = TextEditingController();

//     final currentStep = ref.watch(stepProvider);
//     final stepNotifier = ref.read(stepProvider.notifier);
//     final _isPanelVisible = ref.watch(panelVisibilityProvider);
//     final PanelNotifier = ref.read(panelVisibilityProvider.notifier);
//     final customerAudience = ref.watch(customerAudienceProvider);
//     final runOncePerCustomer = ref.watch(runOncePerCustomerProvider);
//     GetData();

//     void _changeStep() {
//       if (_formKey.currentState?.validate() ?? false) {
//         stepNotifier.changeStep();
//       }
//     }

//     void _togglePanel() {
//       PanelNotifier.togglePanel();
//     }

//     return Scaffold(
//       body: Stack(
//         children: [
//           Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 13),
//                 const Center(
//                   child: Text(
//                     "Create New Email Campaign",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//                   ),
//                 ),
//                 const Center(
//                   child: Text(
//                     "Fill Out these details to build your broadcast",
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Campaign Subject',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       TextFormField(
//                         controller: campaignController,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xffE64A19))),
//                           hintText: 'Enter Subject',
//                         ),
//                         validator: (value) => value?.isEmpty ?? true
//                             ? 'Subject is required'
//                             : null,
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Preview Text',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       TextFormField(controller: previewController,
//                         maxLines: 3,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xffE64A19))),
//                           hintText: 'Enter text here...',
//                         ),
//                         validator: (value) =>
//                             (value != null && value.length > 50)
//                                 ? "Limit exceeded"
//                                 : null,
//                       ),
//                       const SizedBox(height: 6),
//                       const Text('Keep it simple, up to 50 characters'),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('"From" Name',
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold)),
//                                 TextFormField(controller: nameController,
//                                   decoration: const InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(0xffE64A19))),
//                                     hintText: 'From Anne',
//                                   ),
//                                   validator: (value) => value?.isEmpty ?? true
//                                       ? '"From" Name is required'
//                                       : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   '"From" Email',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 TextFormField(controller: emailController,
//                                   decoration: const InputDecoration(
//                                     border: OutlineInputBorder(),
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide: BorderSide(
//                                             color: Color(0xffE64A19))),
//                                     hintText: 'Anne@example.com',
//                                   ),
//                                   validator: (value) => value?.isEmpty ?? true
//                                       ? '"From" Email is required'
//                                       : null,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 130.0),
//                         child: Row(
//                           children: [
//                             const Text(
//                               'Run only once per customer',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             const Spacer(),
//                             Switch(
//                               value: runOncePerCustomer,
//                               onChanged: (value) {
//                                 ref
//                                     .read(runOncePerCustomerProvider.notifier)
//                                     .set(value);
//                               },
//                               activeColor: const Color(0xffE64A19),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 130.0),
//                         child: Row(
//                           children: [
//                             const Text(
//                               'Customer audience',
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             const Spacer(),
//                             Switch(
//                               value: customerAudience,
//                               onChanged: (value) {
//                                 ref
//                                     .read(customerAudienceProvider.notifier)
//                                     .set(value);
//                               },
//                               activeColor: const Color(0xffE64A19),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Row(
//                         children: [
//                           Text("You can set up a"),
//                           SizedBox(width: 4),
//                           Text(
//                             "custom domain or connect your email service provider",
//                             style: TextStyle(color: Color(0xffE64A19)),
//                           ),
//                           SizedBox(width: 4),
//                           Text("to change this."),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: OutlinedButton(
//                               onPressed: () {
//                                 _showSnackBar(
//                                     context, "Draft saved successfully.");
                                  
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(6)),
//                                 ),
//                                 side:
//                                     const BorderSide(color: Color(0xffE64A19)),
//                               ),
//                               child: const Text(
//                                 "Save Draft",
//                                 style: TextStyle(color: Color(0xffE64A19)),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             flex: 2,
//                             child: ElevatedButton(
//                               onPressed: _changeStep,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xffE64A19),
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(6)),
//                                 ),
//                               ),
//                               child: const Text(
//                                 "Next Step",
//                                 style: TextStyle(color: Color(0xffFFFFFF)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 300),
//             right: _isPanelVisible ? 0 : -260,
//             top: 0,
//             bottom: 0,
//             width: 400,
//             child: GestureDetector(
//               onTap: _togglePanel,
//               child: StepPanel(currentStep: currentStep),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_campaign_app/core/db/shared/sharedpref.dart';
import 'package:screl_campaign_app/screens/step_screen.dart';
import 'package:screl_campaign_app/state/panel/panel_state_provider.dart';
import 'package:screl_campaign_app/state/step/step_state_provider.dart';
import 'package:screl_campaign_app/state/switch/switch_state_provider.dart';

class HomeScreen2 extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final campaignController = TextEditingController();
  final previewController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // Method to show a snackbar message
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Method to retrieve data from SharedPreferences and set it in the TextEditingControllers
  void _loadData() async {
    campaignController.text = await GetSharedPreferences.getCampaign() ?? '';
    previewController.text = await GetSharedPreferences.getPreview() ?? '';
    nameController.text = await GetSharedPreferences.getName() ?? '';
    emailController.text = await GetSharedPreferences.getEmail() ?? '';
  }

  // Method to save data to SharedPreferences
  void _saveData() async {
    await SetSharedPreferences.storeCampaign(campaignController.text);
    await SetSharedPreferences.storePreview(previewController.text);
    await SetSharedPreferences.storeName(nameController.text);
    await SetSharedPreferences.storeEmail(emailController.text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load shared preferences data when the screen is built
    _loadData();

    final currentStep = ref.watch(stepProvider);
    final stepNotifier = ref.read(stepProvider.notifier);
    final _isPanelVisible = ref.watch(panelVisibilityProvider);
    final panelNotifier = ref.read(panelVisibilityProvider.notifier);
    final customerAudience = ref.watch(customerAudienceProvider);
    final runOncePerCustomer = ref.watch(runOncePerCustomerProvider);

void _saveDraft() {
      _showSnackBar(context, "Draft saved successfully.");
    }
    void _changeStep() {
      if (_formKey.currentState?.validate() ?? false) {
        _saveData(); // Save data on successful validation
        stepNotifier.changeStep();
      }
    }

    void _togglePanel() {
      panelNotifier.togglePanel();
    }

    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 13),
                const Center(
                  child: Text(
                    "Create New Email Campaign",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const Center(
                  child: Text(
                    "Fill Out these details to build your broadcast",
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Campaign Subject',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: campaignController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE64A19))),
                          hintText: 'Enter Subject',
                        ),
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Subject is required'
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Preview Text',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: previewController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE64A19))),
                          hintText: 'Enter text here...',
                        ),
                        validator: (value) =>
                            (value != null && value.length > 50)
                                ? "Limit exceeded"
                                : null,
                      ),
                      const SizedBox(height: 6),
                      const Text('Keep it simple, up to 50 characters'),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('"From" Name',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffE64A19))),
                                    hintText: 'From Anne',
                                  ),
                                  validator: (value) => value?.isEmpty ?? true
                                      ? '"From" Name is required'
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '"From" Email',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xffE64A19))),
                                    hintText: 'Anne@example.com',
                                  ),
                                  validator: (value) => value?.isEmpty ?? true
                                      ? '"From" Email is required'
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 130.0),
                        child: Row(
                          children: [
                            const Text(
                              'Run only once per customer',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Switch(
                              value: runOncePerCustomer,
                              onChanged: (value) {
                                ref.read(runOncePerCustomerProvider.notifier)
                                    .set(value);
                              },
                              activeColor: const Color(0xffE64A19),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 130.0),
                        child: Row(
                          children: [
                            const Text(
                              'Customer audience',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Switch(
                              value: customerAudience,
                              onChanged: (value) {
                                ref.read(customerAudienceProvider.notifier)
                                    .set(value);
                              },
                              activeColor: const Color(0xffE64A19),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _saveData,onLongPress: _saveDraft,
                              style: OutlinedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                                side: const BorderSide(color: Color(0xffE64A19)),
                              ),
                              child: const Text(
                                "Save Draft",
                                style: TextStyle(color: Color(0xffE64A19)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: _changeStep,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffE64A19),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(6)),
                                ),
                              ),
                              child: const Text(
                                "Next Step",
                                style: TextStyle(color: Color(0xffFFFFFF)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            right: _isPanelVisible ? 0 : -260,
            top: 0,
            bottom: 0,
            width: 400,
            child: GestureDetector(
              onTap: _togglePanel,
              child: StepPanel(currentStep: currentStep),
            ),
          ),
        ],
      ),
    );
  }
}
