// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       appBar: AppBar(title: Text("Test")),
//       body: GetBuilder<TestController>(
//         builder: (controller) {
//           return HandlindDataView(
//             statusRequset: controller.statusRequset,
//             widget: ListView.builder(
//               itemCount: controller.data.length,
//               itemBuilder: (context, index) {
//                 return Text("${controller.data}");
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
