import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../models/receipt_detail_model.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../res/styles/text_styles.dart';
import '../../view_models/controller/home/home_view_model.dart';

class PastReceiptsView extends StatefulWidget {
  const PastReceiptsView({Key? key}) : super(key: key);

  @override
  State<PastReceiptsView> createState() => _PastReceiptsViewState();
}

class _PastReceiptsViewState extends State<PastReceiptsView> {
  final homeVM = Get.put(HomeViewModel());

  ReceiptDetailModel? selectedReceiptDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  init() async {
    _getPastReceipts();
  }

  void _getPastReceipts() {
    homeVM.getPastReceipts();
  }

  _listItem(index, ReceiptDetailModel receiptDetail) {
    return InkWell(
      onTap: () {
        homeVM.selectedReceipt.value = receiptDetail;
        Get.toNamed(RouteName.imagePreview);
      },
      child: Card(
        elevation: 0.5,
        color: index % 2 == 0 ? Colors.indigo.shade50 : Colors.teal.shade50,
        margin: const EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: Image.network(
                      'http://3.135.219.244:2071/Content/Item/${receiptDetail.referenceId}',
                      fit: BoxFit.contain,
                      errorBuilder: (ctx, o, n) {
                        return const Icon(
                          Icons.image_outlined,
                          size: 36,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${receiptDetail.orderNo}',
                                style: Styles.commonTextStyle(
                                  context: context,
                                  size: 4,
                                  color: Colors.blueGrey[900]!,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '\$${receiptDetail.subTotal}',
                              style: Styles.commonTextStyle(
                                context: context,
                                size: 3,
                                color: Colors.grey[600]!,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${receiptDetail.restaurantName}',
                          style: Styles.commonTextStyle(
                            context: context,
                            size: 3,
                            color: Colors.grey[600]!,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ReceiptDetailModel>> getFilterData(filter) async {
    List<ReceiptDetailModel> mList = [];
    for (var element in homeVM.pastReceipts) {
      if (element.orderNo!
          .toLowerCase()
          .contains(filter.toString().toLowerCase())) {
        mList.add(element);
      }
    }
    return mList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'past_receipts'.tr,
          style: Styles.commonTextStyle(
            context: context,
            size: 6,
            color: const Color(0xff44972c),
            fontWeight: FontWeight.w500,
          ).copyWith(fontSize: 24),
        ),
        backgroundColor: const Color(0xfffbe74d),
        iconTheme: const IconThemeData(
          color: Color(0xff44972c),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  switch (homeVM.rxRequestStatus.value) {
                    case Status.LOADING:
                      return const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ));
                    case Status.ERROR:
                      if (homeVM.error.value == 'No internet') {
                        return InterNetExceptionWidget(
                          onPress: () {
                            _getPastReceipts();
                          },
                        );
                      } else {
                        return GeneralExceptionWidget(onPress: () {
                          _getPastReceipts();
                        });
                      }
                    case Status.COMPLETED:
                      return homeVM.searchReceipts.value.isNotEmpty
                          ? Column(
                              children: [
                                DropdownSearch<ReceiptDetailModel>(
                                  asyncItems: (String filter) =>
                                      getFilterData(filter),
                                  compareFn: (i, s) => i.isEqual(s),
                                  onChanged: (value) {
                                    if (value != null) {
                                      var detail = value;
                                      homeVM.getSearchReceipts(detail.orderNo!);
                                    } else {
                                      homeVM.getSearchReceipts('');
                                    }
                                  },
                                  itemAsString: (ReceiptDetailModel u) =>
                                      u.orderNo!,
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: '-- Search --',
                                    ),
                                  ),
                                  popupProps: const PopupProps.menu(
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                  ),
                                  clearButtonProps:
                                      const ClearButtonProps(isVisible: true),
                                ),
                                const SizedBox(height: 4),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: homeVM.searchReceipts.value.length,
                                  itemBuilder: (context, index) {
                                    ReceiptDetailModel receiptDetail =
                                        homeVM.searchReceipts.value[index];

                                    if (index == 2) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _listItem(index, receiptDetail)
                                        ],
                                      );
                                    }
                                    return _listItem(index, receiptDetail);
                                  },
                                )
                              ],
                            )
                          : Center(
                              child: Text('no_record_found'.tr),
                            );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
        child: FloatingActionButton(
          onPressed: () {
            _getPastReceipts();
          },
          tooltip: 'refresh'.tr,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}
