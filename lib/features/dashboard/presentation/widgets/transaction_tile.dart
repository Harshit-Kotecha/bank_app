import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transactionModel,
  });

  final TransactionModel transactionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: scaleH(context, 15)),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: AppColors.fCFCFCF,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: AppColors.fEFEFEF),
                child: SvgPicture.asset(Assets.logoSvg),
              ),
              Spacing.horizontalSpacing(context, 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Ramesh Jain",
                    textStyle: CustomTextStyle.textStyle14Bold(
                      context,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  CustomText(
                    text: "Dec 15, 2023",
                    textStyle: CustomTextStyle.textStyle12R(
                      context,
                      color: AppColors.lightTitleText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            text:
                "${transactionModel.isCredit ? '+' : '-'}£${transactionModel.amount}",
            textStyle: CustomTextStyle.textStyle14Bold(
              context,
              color:
                  transactionModel.isCredit ? AppColors.green : AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
