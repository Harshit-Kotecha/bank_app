import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.transactionModel});

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scaleH(context, 8)),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.fC2C2C2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Paytm Merchant via UPI",
                textStyle: CustomTextStyle.textStyle13(
                  context,
                ),
              ),
              Spacing.verticalSpacing(context, 4),
              CustomText(
                text: "2024.02.18",
                textStyle: CustomTextStyle.textStyle10Regular(
                  context,
                  color: AppColors.f8E8E8E,
                ),
              ),
            ],
          ),
          CustomText(
            text:
                "${transactionModel.isCredit ? '+' : '-'}£${transactionModel.amount}",
            textStyle: TextStyle(
              fontSize: scaleW(context, 15),
              fontWeight: FontWeight.w500,
              color:
                  transactionModel.isCredit ? AppColors.green : AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
